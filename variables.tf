variable "function_name" {
  description = "The name of the Lambda function."
  type        = string
}

variable "handler" {
  description = "The handler for the Lambda function."
  type        = string
  default = "index.lambda_handler"
}

variable "runtime" {
  description = "The runtime for the Lambda function."
  type        = string
  default = "python3.8"
}

variable "memory_size" {
  description = "The amount of memory that your function has access to. Increasing the function's memory also increases its CPU allocation."
  type        = number
  default = 128
}

variable "amazon_policy_list" {
  description = "list of aws managed policies to attach. Defaults to de basic execution role"
  type = list(string)
  default = [
    "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
  ]
}