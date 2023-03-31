terraform {

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.19.0"
    }
    random = {
      source = "hashicorp/random"
    }
  }

  backend "s3" {
    bucket = "kxc-desafio-tecnico"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = var.aws_region
}