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

locals {
  tfvars = jsondecode(file("env/${terraform.workspace}.tfvars.json"))

  prefix = "${terraform.workspace}-terraform-ec2-redis-test"
}

module "ec2" {
  source = "./ec2"
  prefix = local.prefix
}
