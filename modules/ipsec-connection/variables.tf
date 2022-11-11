variable "cpe_display_name" {
  description = "CPE_name"
}

variable "cpe_ip_address" {
  description = "IP_address"
}

variable "ike_identifier" {
  description = "IKE Identifier IP"
  default     = ""
}

variable "tenancy_ocid" {
}

variable "network_compartment_name" {
  description = "Compartment_name"
}

variable "drg_id" {
  type        = string
  description = "DRG ID"
}

variable "ipsec_connection_static_routes" {
  description = "Ipsec Connection Static Routes"
}

variable "ipsec_connection_cpe_local_identifier" {
  type        = string
  default     = ""
  description = "CPE Local Identifier"
}

variable "ipsec_connection_cpe_local_identifier_type" {
  type        = string
  default     = ""
  description = "CPE Local Identificer Type"
}

variable "display_name" {
  type    = string
  default = ""
}

variable "ip_sec_connection_tunnel_management_routing_tun1" {
  type    = string
  default = ""
}

/*variable "ip_sec_connection_tunnel_management_bgp_session_info_customer_bgp_asn_tun1" {
  type        = string
  default     = ""
}*/

variable "ike_version_tun1" {
  type    = string
  default = ""
}

variable "ip_sec_connection_tunnel_management_routing_tun2" {
  type    = string
  default = ""
}

variable "ip_sec_connection_tunnel_management_bgp_session_info_customer_bgp_asn_tun2" {
  type    = string
  default = ""
}

variable "ike_version_tun2" {
  type    = string
  default = ""
}


variable "bgp_session_info1" {
  type = object({
    oracle_interface_ip   = string,
    customer_interface_ip = string,
    customer_bgp_asn      = string
  })
}

variable "bgp_session_info2" {
  type = object({
    oracle_interface_ip   = string,
    customer_interface_ip = string,
    customer_bgp_asn      = string
  })
}

/*variable "shared_secret1" {
  description = "Shared Secret 1"
  default     = ""
}

variable "shared_secret2" {
  description = "Shared Secret 2"
  default     = ""
}*/

variable "freeform_tags" {
  type        = map(any)
  default     = {}
  description = "Free-form tags for this resource."
}
