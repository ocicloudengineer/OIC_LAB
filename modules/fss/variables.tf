variable "tenancy_ocid" {
}

variable "compartment_id" {
  type        = string
  description = "Compartment Id"
  default     = ""
}

variable "display_name" {
  type        = string
  description = "CIDR Block"
}

variable "compartment_name" {
  type        = string
  description = "Comportment Name"
}

variable "network_compartment" {
  type        = string
  description = "network compartment name"
}

variable "subnet_id" {
  type        = string
  description = "Subnet Id"
  default     = ""
}

variable "subnet_display_name" {
  type        = string
  description = "Subnet display name"
}

variable "availability_domain" {
  type        = string
  description = "Availability Domain"
}

variable "ip_address" {
  type    = string
  default = ""
}

variable "hostname_label" {
  type    = string
  default = ""
}

variable "display_name_mt" {
  type    = string
  default = ""
}

variable "freeform_tags" {
  type        = map(any)
  default     = {}
  description = "Free-form tags for this resource."
}

variable "nsg_name" {
  type        = string
  default     = ""
  description = "nombre del nsg"

}

variable "common_tags_values" {
  type = map(any)
  default = {
    "Environment"  = ""
    "Owner"        = ""
    "Creator"      = ""
    "Label"        = ""
    "SO"           = ""
    "Project"      = ""
    "Organization" = ""
    "Service"      = ""
    "CostCenter"   = ""
    "IDContabil"   = ""
    "Namespace"    = "REQUIRED"
  }
  description = "Defined tags for this resource."
}
