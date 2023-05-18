variable "function_name" {
  description = "The name of the Lambda function.\nChose an unique and meanifull name as it will appear in the console."
  type        = string
}

variable "handler" {
  description = "The handler for the Lambda function."
  type        = string
  default = "index.lambda_handler"
}

variable "runtime" {
  description = "The runtime for the Lambda function. This should be a valid version of python."
  type        = string
  default = "python3.8"
}

variable "memory_size" {
  description = "The amount of memory that your function has access to. Increasing the function's memory also increases its CPU allocation."
  type        = number
  default = 128
}

variable "amazon_policy_list" {
  description = "list of aws managed policies to attach.\nDefaults to de basic execution role."
  type = list(string)
  default = [
    "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
  ]
}

variable "custom_policy" {
  description = "A custom IAM policy to attach to the execution role"
  type = string
  default = null
}

variable "environment_variables" {
  description = "Map of environment variables for the Lambda function"
  type        = map(string)
  default     = {}
}