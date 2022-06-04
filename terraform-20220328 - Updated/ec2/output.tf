output "id" {
  description = "The ID of the instance"
  value       = {for k, v in module.ec2: k => v.id}
}

output "arn" {
  description = "The ARN of the instance"
  value       = {for k, v in module.ec2: k => v.arn}
}
