## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_archive"></a> [archive](#provider\_archive) | n/a |
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |
| <a name="provider_null"></a> [null](#provider\_null) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_role.lambda_function_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.lambda_function_role_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_lambda_function.lambda_function](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_function) | resource |
| [null_resource.install_dependencies](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [archive_file.function_zip](https://registry.terraform.io/providers/hashicorp/archive/latest/docs/data-sources/file) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_function_name"></a> [function\_name](#input\_function\_name) | The name of the Lambda function. | `string` | n/a | yes |
| <a name="input_handler"></a> [handler](#input\_handler) | The handler for the Lambda function. | `string` | `"index.lambda_handler"` | no |
| <a name="input_memory_size"></a> [memory\_size](#input\_memory\_size) | The amount of memory that your function has access to. Increasing the function's memory also increases its CPU allocation. | `number` | `128` | no |
| <a name="input_runtime"></a> [runtime](#input\_runtime) | The runtime for the Lambda function. | `string` | `"python3.8"` | no |

## Outputs

No outputs.
