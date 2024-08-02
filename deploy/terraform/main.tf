resource "aws_s3_bucket" "terraform_state_bucket" {
  bucket = "aws-cloud-practitioner-terraform-state-bucket"
  acl    = "public-read-write"

  tags = {
    Name        = "Terraform State Bucket"
    Environment = "Dev"
  }
}

resource "aws_db_instance" "postgres" {
  allocated_storage    = 20                      
  storage_type         = "gp2"                   
  engine               = "postgres"              
  engine_version       = "13.3"                  
  instance_class       = "db.t3.micro"           
  db_name              = "aws-cloud-practitioner-db"
  username             = "admin"                 
  password             = "Password,1"          
  parameter_group_name = "default.postgres13"    
  skip_final_snapshot  = true                    

  tags = {
    Name = "PostgreSQL DB"
  }
}

# terraform {
#   required_version = ">= 1.0.0"

#   backend "s3" {
#     bucket = "aws-cloud-practitioner-terraform-state-bucket"
#     key    = "terraform/state"
#     region = "eu-west-1"
#   }
# }

