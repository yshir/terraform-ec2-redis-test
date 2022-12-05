resource "aws_instance" "app_server" {
  ami           = "ami-072bfb8ae2c884cc4"
  instance_type = "t2.micro"

  tags = {
    Name = "${var.prefix}-app-server"
  }
}
