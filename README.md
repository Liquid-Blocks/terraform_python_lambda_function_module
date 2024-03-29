# Python Lambda Function Using Terraform
## Basic Usage

To deploy a lambda function with this module, you need to have at least the following structure:

Alternatively, you can directly place the module's source code in `/modules`.

```
  |-- src/
  |   `-- my_function_name/
  |       |-- index.py   
  |       `-- requirements.txt
  `-- main.tf  
```

`index.py` should have the business logic under a `lambda_handler(event, context)` function.

Fill in the `main.tf` with the following code:

```
provider "aws" {
  profile="your_profile_name"
  region="ca-central-1"
}

module "my_function_name" {
  # The source can be set to fetch directly from a git repository. It is possible to specify a release.
  source = "git::https://github.com/Liquid-Blocks/terraform_python_lambda_function_module.git"
  function_name = "my_function_name"
}
```

Once the structure is in place:

1. Configure AWS SSO using the command `aws configure sso`.
        The profile name you use in SSO must be the same as in `main.tf` on line 2.
2. Initialize Terraform using the command `terraform init`.
3. Apply the changes using the command `terraform apply`.


## Providers

| Name | Version |
|------|---------|
| <a name="provider_archive"></a> [archive](#provider\_archive) | ~> 2.3.0 |
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 4.67.0 |
| <a name="provider_null"></a> [null](#provider\_null) | ~> 3.2.0 |
## Resources

| Name | Type |
|------|------|
| [aws_iam_role.lambda_function_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_lambda_function.lambda_function](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_function) | resource |
| [null_resource.install_dependencies](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [archive_file.function_zip](https://registry.terraform.io/providers/hashicorp/archive/latest/docs/data-sources/file) | data source |
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_amazon_policy_list"></a> [amazon\_policy\_list](#input\_amazon\_policy\_list) | list of aws managed policies to attach.<br>Defaults to de basic execution role. | `list(string)` | <pre>[<br>  "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"<br>]</pre> | no |
| <a name="input_function_name"></a> [function\_name](#input\_function\_name) | The name of the Lambda function.<br>Chose an unique and meanifull name as it will appear in the console. | `string` | n/a | yes |
| <a name="input_handler"></a> [handler](#input\_handler) | The handler for the Lambda function. | `string` | `"index.lambda_handler"` | no |
| <a name="input_memory_size"></a> [memory\_size](#input\_memory\_size) | The amount of memory that your function has access to. Increasing the function's memory also increases its CPU allocation. | `number` | `128` | no |
| <a name="input_runtime"></a> [runtime](#input\_runtime) | The runtime for the Lambda function. This should be a valid version of python. | `string` | `"python3.8"` | no |

