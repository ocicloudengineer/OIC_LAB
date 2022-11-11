#VPN Site to Site para AWS
#CPE address:  3.228.68.88->CPE IP (edited) 
# 172.31.48.0/20->IP subnet AWS (edited)

module "ip-sec-oic-lab-dr" {
  tenancy_ocid                  = var.tenancy_ocid
  source = "../../modules/ipsec-connection"
  #Required
  network_compartment_name      = "ORA_TCE_${var.environment}_LAB_DR_COM_NET"
  cpe_ip_address                = "3.228.68.88"
  ike_identifier                = "3.228.68.88"
  cpe_display_name              = "ORA-TCE-${var.environment}-LAB-DR-CPE-01"
  drg_id                        = var.drg_prd_ocid
  ipsec_connection_static_routes= ["172.31.48.0/20"]
  display_name                  = "ORA-TCE-${var.environment}-LAB-DR-IPC-01"
  ip_sec_connection_tunnel_management_routing_tun1 = "STATIC" #STATIC or BGP
  bgp_session_info1 = { }  #IF BGP then write a number string in all
  ike_version_tun1 = "V1" # V1 or V2
  ip_sec_connection_tunnel_management_routing_tun2 = "STATIC" #STATIC, POLICY or BGP
  bgp_session_info2 = { }  #IF BGP then write a number string in all
  ike_version_tun2 = "V1" # V1 or V2
}