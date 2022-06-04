variable "profile" {
  description = "The name of the profile to use"
  default     = ""
}

variable "region" {
  description = "The region to use"
  default     = ""
}

variable "name" {
  description = "Transit Gateway Name"
  default     = ""
}

variable "description" {
  description = "Transit Gateway Description"
  default     = ""
}

variable "amazon_side_asn" {
  description = "Amazon side ASN"
  default     = ""
}

variable "enable_auto_accept_shared_attachments" {
  description = "Enable Auto Accept Shared Attachments"
  default     = ""
}

variable "vpc_attachments" {
  description = "VPC Attachments"
  default     = {
  }
}

variable "ram_allow_external_principals" {
  description = "Allow External Principals"
  default     = ""
}

variable "ram_principals" {
  description = "RAM Principals"
  default     = []
}

variable "tags" {
  description = "Tags"
  default     = {
  } 
}