terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  backend "s3" {
    bucket  = "terraform-ec2-redis-test-tfstate"
    region  = "ap-northeast-1"
    key     = "terraform.tfstate"
    encrypt = true
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "ap-northeast-1"
}

resource "aws_instance" "app_server" {
  ami           = "ami-072bfb8ae2c884cc4"
  instance_type = "t2.micro"

  tags = {
    Name = "${terraform.workspace}-terraform-ec2-redis-test"
  }
}
