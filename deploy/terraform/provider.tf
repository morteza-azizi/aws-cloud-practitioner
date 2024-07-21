terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket = "aws-cloud-practitioner-terraform-state-bucket"
    key    = "terraform/state"
    region = "eu-west-1"
  }
}

provider "aws" {
  region = var.aws_region
}