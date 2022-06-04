data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {  
    bucket  = ""  #change here
    key     = "terraform/vpc/terraform.tfstate"
    region  = "eu-west-1"
    profile = "technopath"
  }
}

locals {
    vpcs = {
      transit = {
        name                                            = "transit-app"
        vpc_id                                          = data.terraform_remote_state.vpc.outputs.vpc_id["transit"]
        subnet_ids                                      = data.terraform_remote_state.vpc.outputs.public_subnets["transit"]
        associate_public_ip_address                     = true    
      },
      management = {
        name                                            = "management-app"
        vpc_id                                          = data.terraform_remote_state.vpc.outputs.vpc_id["management"]
        subnet_ids                                      = data.terraform_remote_state.vpc.outputs.private_subnets["management"]
        associate_public_ip_address                     = false
      },
      security = {
        name                                            = "security-app"
        vpc_id                                          = data.terraform_remote_state.vpc.outputs.vpc_id["security"]
        subnet_ids                                      = data.terraform_remote_state.vpc.outputs.private_subnets["security"]
        associate_public_ip_address                     = false
      },
      production = {
        name                                            = "production-app"
        vpc_id                                          = data.terraform_remote_state.vpc.outputs.vpc_id["production"]
        subnet_ids                                      = data.terraform_remote_state.vpc.outputs.private_subnets["production"]
        associate_public_ip_address                     = false
      }  
   }
}
