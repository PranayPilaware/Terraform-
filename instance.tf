provider "aws" {
  region = "us-west-1"

}
resource "aws_instance" "myec2" {
  ami           = "ami-020cba7c55df1f615"
  instance_type = "t2.micro"
  key_name      = "new test.pm"
  vpc_security_group_ids = ["mysg"]
  tags = {
    Name ="spiderman instance"
  }
}