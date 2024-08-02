terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 2.70"
    }
  }

  required_version = ">=0.14.9"

    backend "s3" {
    bucket = "aws-cloud-practitioner-terraform-state-bucket"
    key    = "terraform/state"
    region = "eu-west-1"
  }
}

provider "aws" {
  version = "~> 2.70"
  region  = "east-us-1"
}
