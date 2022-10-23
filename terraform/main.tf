provider "aws" {
  region = "ap-northeast-2"
}

locals {
  application_name = "mystack-demo"
  environment      = "prod"
}

module "web_app" {
  source = "./modules/front_web_app"

  application_name        = local.application_name
  environment             = local.environment
  certificate_domain_name = "mystack.io"
  cloudfront_domain_name  = "demo.mystack.io"
}

module "cicd_pipeline" {
  source = "./modules/front_pipeline"

  application_name = local.application_name
  environment      = local.environment
  repository_name  = "eunchurn/terraform-react-s3-cloudfront-pipeline" // Github {organization}/{repository_name}
  branch_name      = "deploy"                                          // Deployment branch
}


output "website_cdn_id" {
  value = module.web_app.website_cdn_id
}

output "website_endpoint" {
  value = module.web_app.website_endpoint
}
