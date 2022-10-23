variable "application_name" {
  description = "The name of the application"
  type        = string
}

variable "environment" {
  description = "Applicaiton environment"
  type        = string
}

variable "certificate_domain_name" {
  description = "Domain name of certificate"
  type        = string
}


variable "cloudfront_domain_name" {
  description = "CloudFront domain name"
  type        = string
}
