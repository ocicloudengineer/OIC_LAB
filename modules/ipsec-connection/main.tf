# terraform {
#   required_version = "~> 1.1.4"
#   required_providers {
#     oci = {
#       source  = "hashicorp/oci"
#       version = "4.17"
#     }
#   }
# }
# # ----------------------------------------------------------------------------------------------------------------------
# ipsec
# ----------------------------------------------------------------------------------------------------------------------
resource "oci_core_cpe" "cpe" {
  #Required
  compartment_id = data.oci_identity_compartments.get_network_compartment.compartments[0].id
  ip_address     = var.cpe_ip_address

  #Optional
  display_name  = var.cpe_display_name
  freeform_tags = var.freeform_tags
}

resource "oci_core_ipsec" "main" {
  compartment_id       = data.oci_identity_compartments.get_network_compartment.compartments[0].id
  cpe_id               = oci_core_cpe.cpe.id
  drg_id               = var.drg_id
  static_routes        = var.ipsec_connection_static_routes
  cpe_local_identifier = var.ike_identifier

  #Optional
  display_name  = var.display_name
  freeform_tags = var.freeform_tags
}

resource "oci_core_ipsec_connection_tunnel_management" "tunnel_management1" {
  #Required
  ipsec_id  = oci_core_ipsec.main.id
  tunnel_id = data.oci_core_ipsec_connection_tunnels.tunnels.ip_sec_connection_tunnels[0].id
  routing   = var.ip_sec_connection_tunnel_management_routing_tun1
  #Optional
  bgp_session_info {
    #Optional
    customer_bgp_asn      = var.bgp_session_info1.customer_bgp_asn
    customer_interface_ip = var.bgp_session_info1.customer_interface_ip
    oracle_interface_ip   = var.bgp_session_info1.oracle_interface_ip
  }
  #    display_name = var.ip_sec_connection_tunnel_management_display_name

  encryption_domain_config {
    #Optional
    #        cpe_traffic_selector = var.ip_sec_connection_tunnel_management_encryption_domain_config_cpe_traffic_selector
    #        oracle_traffic_selector = var.ip_sec_connection_tunnel_management_encryption_domain_config_oracle_traffic_selector
  }
  #    shared_secret = var.shared_secret1
  ike_version = var.ike_version_tun1
}

resource "oci_core_ipsec_connection_tunnel_management" "tunnel_management2" {
  #Required
  ipsec_id  = oci_core_ipsec.main.id
  tunnel_id = data.oci_core_ipsec_connection_tunnels.tunnels.ip_sec_connection_tunnels[1].id
  routing   = var.ip_sec_connection_tunnel_management_routing_tun2
  #Optional
  bgp_session_info {
    #Optional
    customer_bgp_asn      = var.bgp_session_info2.customer_bgp_asn
    customer_interface_ip = var.bgp_session_info2.customer_interface_ip
    oracle_interface_ip   = var.bgp_session_info2.oracle_interface_ip

  }
  #    display_name = var.ip_sec_connection_tunnel_management_display_name

  encryption_domain_config {
    #Optional
    #        cpe_traffic_selector = var.ip_sec_connection_tunnel_management_encryption_domain_config_cpe_traffic_selector
    #        oracle_traffic_selector = var.ip_sec_connection_tunnel_management_encryption_domain_config_oracle_traffic_selector
  }
  #    shared_secret = var.shared_secret2
  ike_version = var.ike_version_tun2
}
