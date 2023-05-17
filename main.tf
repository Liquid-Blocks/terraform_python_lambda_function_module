resource "null_resource" "install_dependencies" {
  
  provisioner "local-exec" {
    command = "pip install -r ./src/${var.function_name}/requirements.txt -t ./src/${var.function_name}/"
  }

  triggers = {
    always_run = "${timestamp()}"
  }
}

data "archive_file" "function_zip" { 
  type        = "zip"
  source_dir  = "./src/${var.function_name}/"
  output_path = "./builds/${var.function_name}.zip"

  depends_on = [null_resource.install_dependencies]
}

resource "aws_lambda_function" "lambda_function" {
  filename      = data.archive_file.function_zip.output_path
  function_name = var.function_name
  role          = aws_iam_role.lambda_function_role.arn
  handler       = var.handler
  runtime       = var.runtime
  memory_size   = var.memory_size

  source_code_hash = data.archive_file.function_zip.output_base64sha256
}

resource "aws_iam_role" "lambda_function_role" {
  name = "${var.function_name}_role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "lambda_function_role_policy_attachment" {
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
  role       = aws_iam_role.lambda_function_role.name
}
