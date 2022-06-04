provider "aws" {
  region  = var.region
  profile = var.profile 
}

module "tgw" {
  source                                = "./transit-gateway"
  name                                  = var.name
  description                           = var.description
  amazon_side_asn                       = var.amazon_side_asn
  enable_auto_accept_shared_attachments = var.enable_auto_accept_shared_attachments # When "true" there is no need for RAM resources if using multiple AWS accounts
  vpc_attachments                       = local.vpc_attachments 
  ram_allow_external_principals         = var.ram_allow_external_principals
  ram_principals                        = var.ram_principals
  tags                                  = var.tags 
  transit_route_table_ids               = concat(data.terraform_remote_state.vpc.outputs.public_route_table_ids["transit"],data.terraform_remote_state.vpc.outputs.private_route_table_ids["transit"])
  management_route_table_ids            = concat(data.terraform_remote_state.vpc.outputs.public_route_table_ids["management"],data.terraform_remote_state.vpc.outputs.private_route_table_ids["management"])
  security_route_table_ids              = concat(data.terraform_remote_state.vpc.outputs.public_route_table_ids["security"],data.terraform_remote_state.vpc.outputs.private_route_table_ids["security"])
  production_route_table_ids            = concat(data.terraform_remote_state.vpc.outputs.public_route_table_ids["production"],data.terraform_remote_state.vpc.outputs.private_route_table_ids["production"])
}