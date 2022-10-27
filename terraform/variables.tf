variable "region" {
  type        = string
  description = "AWS region to operate from."
  default     = "eu-west-1"
}

variable "lambda" {
  type        = string
  description = "Name of the lambda function."
}

variable "package" {
  type        = string
  description = "Relative path to lambda package."
}