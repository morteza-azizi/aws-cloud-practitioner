terraform {
  required_providers {
    aws = "aws"
  }
}

provider "aws" {
  region = "eu-west-1"
}