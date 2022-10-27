terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"

      # Set specific version, or use .lock.hcl file
      version = "4.36.1"
    }
  }

  backend "s3" {
    bucket = "hello-heni"
    key    = "heni" 
    region = "eu-west-1"
  }
}


# Configure the AWS Provider
provider "aws" {
  region = var.region
}