resource "aws_instance" "app" {
  ami                         = "ami-072bfb8ae2c884cc4"
  instance_type               = "t2.micro"
  subnet_id                   = var.public_subnet_ids[0]
  vpc_security_group_ids      = [aws_security_group.app.id]
  associate_public_ip_address = true

  tags = { Name = "${var.prefix}-app" }
}

resource "aws_eip" "app" {
  instance = aws_instance.app.id
  vpc      = true
  tags     = { Name = "${var.prefix}-app" }
}


resource "aws_security_group" "app" {
  name        = "${var.prefix}-app-sg"
  description = "Security Group for Elasticahe EC2"
  vpc_id      = var.vpc_id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
