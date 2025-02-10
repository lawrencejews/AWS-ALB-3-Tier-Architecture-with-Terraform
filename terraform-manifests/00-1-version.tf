  #Terraform Block
terraform {
  required_version = "~> 1.9"
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 5.84"
    }
     null = {
      source = "hashicorp/null"
      version = "3.2.3"
    }
  }
}

# Provider Block
provider "aws" {
  region = var.aws_region
  profile = "default"
}

