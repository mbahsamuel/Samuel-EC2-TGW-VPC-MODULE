data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket  = "samual-development-terraform-statefiles4"
    key     = "terraform/vpc/terraform.tfstate"
    region  = "eu-west-1"
    profile = "technopath"
  }
}

locals {
    vpc_attachments = {
      transit = {
        vpc_id                                          = data.terraform_remote_state.vpc.outputs.vpc_id["transit"]
        subnet_ids                                      = data.terraform_remote_state.vpc.outputs.private_subnets["transit"]
        vpc_cidr_block                                  = "0.0.0.0/0"#data.terraform_remote_state.vpc.outputs.vpc_cidr_block["transit"]
        dns_support                                     = true
        ipv6_support                                    = false
        transit_gateway_default_route_table_association = true
        transit_gateway_default_route_table_propagation = true
        tgw_routes = [
            {
                destination_cidr_block = "30.0.0.0/16"
            }
        ]
      },
      management = {
        vpc_id                                          = data.terraform_remote_state.vpc.outputs.vpc_id["management"]
        subnet_ids                                      = data.terraform_remote_state.vpc.outputs.private_subnets["management"]
        vpc_cidr_block                                  = data.terraform_remote_state.vpc.outputs.vpc_cidr_block["management"]
        dns_support                                     = true
        ipv6_support                                    = false
        transit_gateway_default_route_table_association = true
        transit_gateway_default_route_table_propagation = true
        tgw_routes = [
            {
                destination_cidr_block = "30.0.0.0/17"
            }
        ]
      },
      security = {
        vpc_id                                          = data.terraform_remote_state.vpc.outputs.vpc_id["security"]
        subnet_ids                                      = data.terraform_remote_state.vpc.outputs.private_subnets["security"]
        vpc_cidr_block                                  = data.terraform_remote_state.vpc.outputs.vpc_cidr_block["security"]
        dns_support                                     = true
        ipv6_support                                    = false
        transit_gateway_default_route_table_association = true
        transit_gateway_default_route_table_propagation = true
        tgw_routes = [
            {
                destination_cidr_block = "30.0.0.0/18"
            }
        ]
      },
      production = {
        vpc_id                                          = data.terraform_remote_state.vpc.outputs.vpc_id["production"]
        subnet_ids                                      = data.terraform_remote_state.vpc.outputs.private_subnets["production"]
        vpc_cidr_block                                  = data.terraform_remote_state.vpc.outputs.vpc_cidr_block["production"]
        dns_support                                     = true
        ipv6_support                                    = false
        transit_gateway_default_route_table_association = true
        transit_gateway_default_route_table_propagation = true
        route_table_ids                                 = concat(data.terraform_remote_state.vpc.outputs.public_route_table_ids["production"],data.terraform_remote_state.vpc.outputs.private_route_table_ids["production"])
        tgw_routes = [
            {
                destination_cidr_block = "80.0.0.0/19"
            }
        ]
      }  
    }
}