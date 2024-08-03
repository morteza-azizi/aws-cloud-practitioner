terraform {
  required_providers {
    source  = "hashicorp/aws"
    version = "~> 5.0"
  }
}

provider "aws" {
  region = "eu-west-1"
}