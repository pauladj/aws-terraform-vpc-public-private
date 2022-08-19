terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.13"
    }
  }
}

provider "aws" {
  region     = var.region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

module "networking" {
  source                   = "./networking"
  region                   = var.region
  environment              = var.environment
  vpc_cidr                 = var.vpc_cidr
  public_subnets_cidr      = var.public_subnets_cidr
  private_subnets_cidr     = var.private_subnets_cidr
  availability_zones       = var.availability_zones
}