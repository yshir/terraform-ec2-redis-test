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

  prefix   = "${terraform.workspace}-${var.app_name}"
  vpc_name = var.app_name
}

module "network" {
  source   = "./network"
  prefix   = local.prefix
  vpc_name = local.vpc_name
}


module "ec2" {
  source            = "./ec2"
  prefix            = local.prefix
  vpc_id            = module.network.vpc_id
  public_subnet_ids = module.network.public_subnet_ids
}

module "elasticache" {
  source             = "./elasticache"
  prefix             = local.prefix
  vpc_id             = module.network.vpc_id
  private_subnet_ids = module.network.private_subnet_ids
  node_count         = 1
}
