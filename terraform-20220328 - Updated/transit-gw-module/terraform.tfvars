#profile                      = "default"
region                       = "us-east-1"
name                         = "mg-gateway"
description                  = "TGW shared with serveral aws accounts"
amazon_side_asn              = "64512"
enable_auto_accept_shared_attachments = true
vpc_attachments              = {
    vpc = {
      vpc_id                                          = "vpc-084158303a0b053ca" # data.remote-state.vpc["mg-vpc"].id
      subnet_ids                                      = [ "subnet-0a872418489bd0d33", "subnet-0f5bddde427af918f" ] # data.remote-state.vpc["public-subnets"].id
      dns_support                                     = true
      ipv6_support                                    = true
      transit_gateway_default_route_table_association = true
      transit_gateway_default_route_table_propagation = true

      tgw_routes = [
        {
          destination_cidr_block = "10.0.0.0/16"
        },
        {
          destination_cidr_block = "0.0.0.0/0"
        }
      ]
    }
}

ram_allow_external_principals                        = true
ram_principals                                       = [307990089504]
tags                                                 = {
    Name = "mg-gateway"
}