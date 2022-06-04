terraform {
  required_version = ">= 0.13.1"
  required_providers {
    aws = {
      version = "< 4.0.0"
      source  = "hashicorp/aws"
    }
  }
}