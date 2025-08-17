provider "aws" {
  region = "us-west-2"  
  
}
resource "aws_instance" "terraform_example" {
    ami           = "ami-0de716d6197524dd9"
    key_name = "new test.pm"
    instance_type = t2.micro# 
    vpc_security_group_ids = ["mysg"]
  
  }
    