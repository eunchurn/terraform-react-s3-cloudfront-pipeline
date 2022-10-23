# Frontend Pipeline
module "frontend_pipeline" {
  source                = "./frontend_pipeline"
  application_name      = var.application_name
  s3_bucket_destination = "${var.application_name}-${var.environment}"
  pipeline_bucket_name  = "${var.application_name}-codepipeline"
  codebuild_bucket_name = "${var.application_name}-codebuild"
  repository_name       = var.repository_name
  branch_name           = var.branch_name
  environment           = var.environment
}
