profile                                  = "technopath"
region                                   = "us-east-1"
vpcs                                     = {
    transit = {
      name                                      = "Transit-VPC"
      cidr                                      = "10.10.0.0/16"
      private_subnets                           = ["10.10.1.0/24", "10.10.2.0/24", "10.10.3.0/24", "10.10.254.0/24"]
      public_subnets                            = ["10.10.101.0/24", "10.10.102.0/24", "10.10.103.0/24"]
      flow_log_cloudwatch_log_group_name_prefix = "/aws/vpc-flow-log/transit-vpc/"
      enable_nat_gateway                        = true
      enable_vpn_gateway                        = false
      create_egress_only_igw                    = false
      create_elasticache_subnet_group           = false
      create_flow_log_cloudwatch_iam_role       = true
      create_flow_log_cloudwatch_log_group      = true
      create_igw                                = true
      tags = {
        Terraform   = "true"
        Environment = "dev"
        Type         = "Transit VPC"
      }
    }
    management = {
      name                                      = "Management-VPC"
      cidr                                      = "10.20.0.0/16"
      private_subnets                           = ["10.20.1.0/24", "10.20.2.0/24", "10.20.3.0/24", "10.20.254.0/24"]
      public_subnets                            = []#["10.20.101.0/24", "10.20.102.0/24"]
      flow_log_cloudwatch_log_group_name_prefix = "/aws/vpc-flow-log/management-vpc/"
      enable_nat_gateway                        = false #true
      enable_vpn_gateway                        = false
      create_egress_only_igw                    = false
      create_elasticache_subnet_group           = false
      create_flow_log_cloudwatch_iam_role       = true
      create_flow_log_cloudwatch_log_group      = true
      create_igw                                = false #true
      tags = {
        Terraform   = "true"
        Environment = "dev"
        Type         = "Management VPC"
      }
    }
    security = {
      name                                      = "Security-VPC"
      cidr                                      = "10.30.0.0/16"
      private_subnets                           = ["10.30.1.0/24", "10.30.2.0/24", "10.30.3.0/24", "10.30.254.0/24"]
      public_subnets                            = []#["10.30.101.0/24", "10.30.102.0/24"]
      flow_log_cloudwatch_log_group_name_prefix = "/aws/vpc-flow-log/security-vpc/"
      enable_nat_gateway                        = false #true
      enable_vpn_gateway                        = false
      create_egress_only_igw                    = false
      create_elasticache_subnet_group           = false
      create_flow_log_cloudwatch_iam_role       = true
      create_flow_log_cloudwatch_log_group      = true
      create_igw                                = false #true
      tags = {
        Terraform   = "true"
        Environment = "dev"
        Type         = "Security VPC"
      }
    }
    production = {
      name                                      = "Production-VPC"
      cidr                                      = "10.40.0.0/16"
      private_subnets                           = ["10.40.1.0/24", "10.40.2.0/24", "10.40.3.0/24", "10.40.254.0/24"]
      public_subnets                            = []#["10.40.101.0/24", "10.40.102.0/24"]
      flow_log_cloudwatch_log_group_name_prefix = "/aws/vpc-flow-log/production-vpc/"
      enable_nat_gateway                        = false #true
      enable_vpn_gateway                        = false
      create_egress_only_igw                    = false
      create_elasticache_subnet_group           = false
      create_flow_log_cloudwatch_iam_role       = true
      create_flow_log_cloudwatch_log_group      = true
      create_igw                                = false #true
      tags = {
        Terraform   = "true"
        Environment = "dev"
        Type         = "Production VPC"
      }
    }
  }
