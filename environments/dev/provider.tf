provider "aws" {
  region                   = var.aws_region
  shared_credentials_files = ["/Users/w.shun/.aws/credentials"]
  profile                  = var.aws_profile
}
