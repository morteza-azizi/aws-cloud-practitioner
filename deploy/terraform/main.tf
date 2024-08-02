terraform {
  required_version = ">= 1.0.0"

 backend "s3" {
    bucket = "aws-cloud-practitioner-terraform-state-bucket"
    key    = "terraform/state"
    region = "eu-west-1"
  }
}

