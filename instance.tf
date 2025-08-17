resource "local_file" "test" {
  content  = "Terraform is working!"
  filename = "${path.module}/terraform_test.txt"
}