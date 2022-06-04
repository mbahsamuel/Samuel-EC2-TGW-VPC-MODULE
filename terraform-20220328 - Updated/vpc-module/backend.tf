# terraform backend.tf
terraform {
    backend "s3" {
        bucket  = "samual-development-terraform-statefiles4"
        key     = "terraform/vpc/terraform.tfstate"
        region  = "eu-west-1"
        profile = "technopath"
    }
}