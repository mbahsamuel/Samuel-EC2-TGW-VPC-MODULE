output "vpc_id" {
  description = "The IDs of the VPC"
  value       = {for k, v in module.kratos_multi_vpc: k => v.vpc_id}
}

output "vpc_arn" {
  description = "The ARNs of the VPC"
  value       = {for k, v in module.kratos_multi_vpc: k => v.vpc_arn}
}

output "public_subnets" {
  description = "The IDs of the public subnets"
  value       = {for k, v in module.kratos_multi_vpc: k => v.public_subnets}
}

output "private_subnets" {
  description = "The IDs of the private subnets"
  value       = {for k, v in module.kratos_multi_vpc: k => v.private_subnets}
}

output "public_route_table_ids" {
  description = "The IDs of the public route table"
  value       = {for k, v in module.kratos_multi_vpc: k => v.public_route_table_ids}
}

output "private_route_table_ids" {
  description = "The IDs of the private route table"
  value       = {for k, v in module.kratos_multi_vpc: k => v.private_route_table_ids}
}

output "database_route_table_ids" {
  description = "The IDs of the database route table"
  value       = {for k, v in module.kratos_multi_vpc: k => v.database_route_table_ids}
}

output "vpc_cidr_block" {
  description = "The IDs of the public route table"
  value       = {for k, v in module.kratos_multi_vpc: k => v.vpc_cidr_block}
}