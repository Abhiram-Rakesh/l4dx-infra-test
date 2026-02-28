terraform {
  required_version = ">= 1.7.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {}
}

provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      Environment = "prod"
      ManagedBy   = "Terraform"
      Repository  = "Abhiram-Rakesh/l4dx-infra-test"
    }
  }
}

variable "aws_region" {
  description = "AWS region for resources"
  type        = string
  default     = "ap-south-1"
}
