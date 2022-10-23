# Frontend Environment
module "static_website_and_cloudfront_distribution" {
  source                  = "./frontend"
  bucket_name             = "${var.application_name}-${var.environment}"
  bucket_acl              = "public-read"
  environment             = var.environment
  certificate_domain_name = var.certificate_domain_name
  cloudfront_domain_name  = var.cloudfront_domain_name
}

output "website_cdn_id" {
  value = module.static_website_and_cloudfront_distribution.website_cdn_id
}

output "website_endpoint" {
  value = module.static_website_and_cloudfront_distribution.website_endpoint
}
