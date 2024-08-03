resource "aws_s3_bucket" "terraform_state_bucket" {
  bucket = "aws-cloud-practitioner-terraform-state-bucket"

  tags = {
    Name        = "Terraform State Bucket"
    Environment = "Dev"
  }
}

resource "aws_db_instance" "postgres" {
  allocated_storage   = 20
  storage_type        = "gp2"
  engine              = "postgres"
  engine_version      = "16.2"
  instance_class      = "db.t3.micro"
  db_name             = "awscloudpractitionerdb"
  username            = "awscloudpractitioner"
  password            = "Password,1"
  skip_final_snapshot = true

  tags = {
    Name = "PostgreSQL DB"
  }
}

terraform {
  required_version = ">= 1.0.0"

  backend "s3" {
    bucket  = "aws-cloud-practitioner-terraform-state-bucket"
    key     = "terraform/state"
    region  = "eu-west-1"
    profile = ""
    encrypt = "true"
  }

  providers = {
    aws = aws
  }
}


