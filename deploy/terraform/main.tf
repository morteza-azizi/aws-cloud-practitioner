resource "aws_db_instance" "default" {
  allocated_storage    = 20
  storage_type         = "gp2"
  engine               = "postgres"
  engine_version       = "13.2"
  instance_class       = "db.t3.micro"
  name                 = var.db_name
  username             = var.db_username
  password             = var.db_password
  parameter_group_name = "default.postgres13"
  db_subnet_group_name = aws_db_subnet_group.default.name
  vpc_security_group_ids = [aws_security_group.default.id]

  tags = {
    Name = "aws-cloud-practitioner-postgres-db"
  }
}

resource "aws_db_subnet_group" "default" {
  name       = "aws-cloud-practitioner-db-subnet-group"
  subnet_ids = aws_subnet.default.*.id

  tags = {
    Name = "aws-cloud-practitioner-db-subnet-group"
  }
}

resource "aws_security_group" "default" {
  name        = "aws-cloud-practitioner-security-group"
  description = "Allow all inbound traffic"
  vpc_id      = aws_vpc.default.id

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "aws-cloud-practitioner-security-group"
  }
}
