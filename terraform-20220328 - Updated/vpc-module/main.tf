provider "aws" {
  region  = var.region
  #profile = var.profile
}

module "kratos_multi_vpc" {
  source    = "./vpc"
  for_each  = var.vpcs

  # VPC VALUES
  name                                      = each.value.name
  cidr                                      = each.value.cidr
  azs                                       = ["${var.region}a", "${var.region}b", "${var.region}c", "${var.region}d"]
  private_subnets                           = each.value.private_subnets
  public_subnets                            = each.value.public_subnets
  enable_nat_gateway                        = each.value.enable_nat_gateway
  enable_vpn_gateway                        = each.value.enable_nat_gateway
  create_igw                                = each.value.create_igw
  flow_log_cloudwatch_log_group_name_prefix = each.value.flow_log_cloudwatch_log_group_name_prefix
  dhcp_options_ntp_servers                  = ["129.6.15.28", "132.163.97.1", "132.163.96.1"]
  enable_dhcp_options                       = true
  create_egress_only_igw                    = false
  create_elasticache_subnet_group           = false
  create_flow_log_cloudwatch_iam_role       = true
  create_flow_log_cloudwatch_log_group      = true
  enable_flow_log                           = true
  flow_log_per_hour_partition               = true
  tags                                      = each.value.tags

}