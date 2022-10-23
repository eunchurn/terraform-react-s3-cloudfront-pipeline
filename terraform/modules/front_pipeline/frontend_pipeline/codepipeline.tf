
resource "aws_codestarconnections_connection" "github" {
  name          = "github-connection"
  provider_type = "GitHub"
}

resource "aws_codepipeline" "main" {
  name     = "${var.application_name}-frontend-${var.environment}"
  role_arn = aws_iam_role.codepipeline_frontend.arn

  artifact_store {
    location = aws_s3_bucket.pipeline_bucket.bucket
    type     = "S3"
  }

  stage {
    name = "Source"
    action {
      name             = "Source"
      category         = "Source"
      owner            = "AWS"
      provider         = "CodeStarSourceConnection"
      version          = "1"
      output_artifacts = ["SourceArtifact"]

      configuration = {
        ConnectionArn    = "${aws_codestarconnections_connection.github.arn}"
        FullRepositoryId = var.repository_name // "eunchurn/terraform-react-s3-cloudfront-pipeline"
        BranchName       = var.branch_name     // "deploy"
      }
    }
  }

  stage {
    name = "Build"

    action {
      name             = "Build"
      category         = "Build"
      owner            = "AWS"
      provider         = "CodeBuild"
      input_artifacts  = ["SourceArtifact"]
      output_artifacts = ["BuildArtifact"]
      version          = "1"

      configuration = {
        ProjectName   = aws_codebuild_project.frontend_build_project.arn
        PrimarySource = "SourceArtifact"
      }

      run_order = 2
    }
  }

  tags = {
    Name        = "${var.application_name}-frontend-codepipeline-${var.environment}"
    Environment = var.environment
  }
}
