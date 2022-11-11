variable "tenancy_ocid" {
}
variable "security_group_name" {
}
variable "network_compartment" {
  default = ""
}
variable "network_compartment_id" {
  default = ""
}
variable "network_vcn" {
  default = ""
}
variable "network_vcn_id" {
  default = ""
}
variable "ingress" {
  type    = list(any)
  default = []
}
variable "egress" {
  type    = list(any)
  default = []
}

variable "freeform_tags" {
  type        = map(any)
  default     = {}
  description = "Free-form tags for this resource."
}
