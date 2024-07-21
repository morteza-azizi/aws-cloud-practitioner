terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }

  backend "s3" {
    bucket = "my-terraform-state-bucket"
    key    = "terraform/state"
    region = var.aws_region
  }
}

provider "aws" {
  region = var.aws_region
}
