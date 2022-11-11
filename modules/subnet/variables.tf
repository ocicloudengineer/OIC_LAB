variable "subnet_cidr_block" {
  type        = string
  description = "CIDR Block"
}

variable "compartment_id" {
  type        = string
  description = "Compartment Id"
}

variable "vcn_id" {
  type        = string
  description = "VCN ID"
}

variable "subnet_availability_domain" {
  type        = string
  default     = ""
  description = "Subnet Availability Domain"
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
  description = "Tags definidas"
}

variable "dhcp_options_id" {
  type        = string
  default     = ""
  description = "DHCP Options"
}

variable "subnet_dns_label" {
  type        = string
  default     = ""
  description = "Subnet DNS Label"
}

variable "display_name" {
  type        = string
  default     = ""
  description = "Nome de Exibição"
}

variable "freeform_tags" {
  type        = map(any)
  default     = {}
  description = "FreeForm Tags"
}

variable "subnet_ipv6cidr_block" {
  type        = string
  default     = null
  description = "IPV6 Block"
}

variable "subnet_prohibit_public_ip_on_vnic" {
  type        = bool
  default     = false
  description = "Whether VNICs within this subnet can have public IP addresses"
}

variable "route_table_id" {
  type        = string
  default     = ""
  description = "The OCID of the route table the subnet will use"
}

variable "subnet_security_list_ids" {
  type        = list(string)
  default     = null
  description = "The OCIDs of the security list or lists the subnet will use"
}
