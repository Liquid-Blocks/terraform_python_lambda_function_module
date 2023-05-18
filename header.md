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

