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