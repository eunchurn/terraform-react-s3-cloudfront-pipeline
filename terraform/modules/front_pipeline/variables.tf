variable "application_name" {
  description = "The name of the application"
  type        = string
}

variable "environment" {
  description = "Applicaiton environment"
  type        = string
}

variable "repository_name" {
  description = "Github Repository full name"
  type        = string
  default     = "mystack-platform/mystack-demo"
}

variable "branch_name" {
  type = string
}
