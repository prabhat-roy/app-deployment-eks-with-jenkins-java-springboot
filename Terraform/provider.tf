provider "aws" {
  region  = var.aws_region
  profile = "default"
}
terraform {
  required_providers {
    http = {
      source  = "hashicorp/http"
      version = "3.4.2"
    }
  }
}
