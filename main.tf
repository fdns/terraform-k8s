terraform {
  backend "s3" {
    bucket = "fdns-terraform-state"
    key    = "cloud-instance"
    region = "us-east-2"
  }
}

provider "aws" {
  region = var.region
}

module "security_group" {
  source  = "./modules/security_group"
  project = var.project
  vpc     = module.vpc.vpc
}

module "vpc" {
  source            = "./modules/vpc"
  vpc_cidr          = var.vpc_cidr
  cloud_cidr        = var.cloud_cidr
  project           = var.project
  region            = var.region
  availability_zone = var.availability_zone
}

module instances {
  source = "./modules/instances"

  project           = var.project
  availability_zone = var.availability_zone
  security_group    = module.security_group.security_group_cloud

  ssh_keys     = var.ssh_keys
  subnet_cloud = module.vpc.aws_subnet_cloud

  default_ami = var.default_ami
  spot_time   = var.spot_time
}
