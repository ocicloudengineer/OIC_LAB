variable "name" {
  description = "Nome da VCN"
  default     = ""
}

variable "cidr_block" {
  type        = string
  description = "CIDR Block Configuration"
}


variable "compartment_id" {
  type        = string
  description = "The OCID of the compartment to containe the VCN"
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

variable "vcn_dns_label" {
  type        = string
  default     = ""
  description = "A DNS label for the VCN."
}

variable "freeform_tags" {
  type        = map(any)
  default     = {}
  description = "Free-form tags for this resource."
}

variable "ipv6cidr" {
  type        = string
  default     = ""
  description = "IPVC6 CIDR Block"
}

variable "ipv6enable" {
  type        = string
  default     = null
  description = "IPVC6 is enable"
}
