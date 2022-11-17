#NSGs agentes
module "network-securiy-group-ora_tce_oic_labdr_nsg_agents" {
  #Required
  source = "../../modules/network-security-group"
  tenancy_ocid = var.tenancy_ocid
  security_group_name = "ORA-TCE-${var.ambiente}-${var.proyecto}-${var.region}-NSG-SEC-AGN"
  network_compartment = "ORA_TCE_${var.environment}_${var.ambiente}_LAB_DR_NET"
  network_vcn         = "ORA-TCE-${var.environment}-LAB-DR-VCN"
  network_vcn_id      = module.vcn_prd_oic.id
  #Rules
  egress = [
    {
      protocol               = "TCP"
      destination_type       = "CIDR_BLOCK"
      destination            = "172.31.48.0/20"
      source                 = "172.16.1.0/16"
      description            = "Desde OIC Agents a AWS Private Cloud"
      source_port_range      = "111"
    },
    {
      protocol               = "TCP"
      destination_type       = "CIDR_BLOCK"
      destination            = "172.31.48.0/20"
      source                 = "172.16.1.0/16"
      description            = "Desde OIC Agents a AWS Private Cloud"
      destination_port_range = "2048-2050"
    }
  ]
  ingress = [
    {
      protocol               = "UDP"
      source_type            = "CIDR_BLOCK"
      source                 = "172.31.48.0/20"
      destination_port_range = "111"
      description            = "Desde AWS Private Cloud hacia OIC Agents"
    },
    {
      protocol               = "UDP"
      source_type            = "CIDR_BLOCK"
      source                 = "172.31.48.0/20"
      destination_port_range = "2048"
      description            = "Desde AWS Private Cloud hacia OIC Agents"
    },
    {
      protocol               = "TCP"
      source_type            = "CIDR_BLOCK"
      source                 = "172.31.48.0/20"
      destination_port_range = "111"
      description            = "Desde AWS Private Cloud hacia OIC Agents"
    },
    {
      protocol               = "TCP"
      source_type            = "CIDR_BLOCK"
      source                 = "172.31.48.0/20"
      destination_port_range = "2048-2050"
      description            = "Desde AWS Private Cloud hacia OIC Agents"
    }
  ]
}