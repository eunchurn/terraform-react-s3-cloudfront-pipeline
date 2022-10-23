[![tfsec](https://github.com/eunchurn/terraform-react-s3-cloudfront-pipeline/actions/workflows/tfsec.yml/badge.svg)](https://github.com/eunchurn/terraform-react-s3-cloudfront-pipeline/actions/workflows/tfsec.yml)

# Terraform CRA AWS Infrastructure

[Blog post](https://www.eunchurn.com/blog/development/2022-10-23-tWIL)
## Prerequisite

- NodeJS 16
- [Terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli)

### Project

- Create React App 
  - `npx create-react-app terraform-react-s3-cloudfront-pipeline --template=typescript`
- Change your App name `terraform/main.tf`
  - `application_name = "{your app name}"`
  - `environment = "{app environment name}"`
- Change your repository info `terraform/main.tf`
  - `repository_name = "{your repository}"`
  - `branch_name = "{your deploy branch}"`
- Change your domain `terraform/main.tf`
  - `certificate_domain_name = "{your ACM name}"` should be `us-east-1` region
  - `cloudfront_domain_name = "{your Domain name}"`

## Usage

- `cd terraform`
- `terraform init`
- `terraform apply`

- Check outputs


