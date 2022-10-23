[![tfsec](https://github.com/eunchurn/terraform-react-s3-cloudfront-pipeline/actions/workflows/tfsec.yml/badge.svg)](https://github.com/eunchurn/terraform-react-s3-cloudfront-pipeline/actions/workflows/tfsec.yml)

# Terraform CRA AWS Infrastructure

CRA app deployment via Terraform AWS S3, CloudFront, CodePipeline, CodeBuild

[Blog post](https://www.eunchurn.com/blog/development/2022-10-23-tWIL)
## Prerequisite

- NodeJS 16
- [Terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli)

### Terraform install for Apple Silicon

[Reference](https://discuss.hashicorp.com/t/template-v2-2-0-does-not-have-a-package-available-mac-m1/35099/4)

- 1. Remove any existing Terraform binary (/usr/bin/terraform and/or /usr/local/bin/terraform)
- 2. Install [m1-terraform-provider-helper](https://github.com/kreuzwerker/m1-terraform-provider-helper)
  - 2.1. `brew install kreuzwerker/taps/m1-terraform-provider-helper`
- 3. Install Terraform
  - 3.1. `brew tap hashicorp/tap`
  - 3.2. `brew install hashicorp/tap/terraform`
- 4. Install the hashicorp/template version v2.2.0
  - 4.1. `m1-terraform-provider-helper activate`
  - 4.2. `m1-terraform-provider-helper install hashicorp/template -v v2.2.0`

```
➜  ~ terraform --version
Terraform v1.3.1
on darwin_arm64
+ provider registry.terraform.io/hashicorp/aws v4.33.0
+ provider registry.terraform.io/hashicorp/random v3.4.3
+ provider registry.terraform.io/hashicorp/template v2.2.0
```
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

## CodeStar Connection

GitHub 리포 연결을 위해서는 콘솔에서 직접 연결해야 함. CodePipeline 에서 Setting

`terraform apply` 이후

CodePipeline > Settings > Connections

Status = Pending 인 커넥션 선택 후 `Update pending connection` 으로 Github 연결
