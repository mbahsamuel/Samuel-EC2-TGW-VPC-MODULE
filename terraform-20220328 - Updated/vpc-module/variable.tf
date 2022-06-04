variable "profile" {
    type = string
    default = ""
}

variable "region" {
  description = "The region to use"
  default     = ""
}
variable "vpcs" {
  description = "Map of vpc names to create"
  default     = {}
}