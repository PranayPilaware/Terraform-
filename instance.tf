terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-west-2"
}

resource "aws_security_group" "mysg" {
  name        = "mysg"
  description = "Allow SSH inbound traffic"
  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "terraform_example" {
  ami                    = "ami-0de716d6197524dd9"
  instance_type          = "t2.micro"
  key_name               = "new-test-pm" // Replace with your actual key pair name
  vpc_security_group_ids = [aws_security_group.mysg.id]

  tags = {
    Name = "TerraformExampleInstance"
  }
}