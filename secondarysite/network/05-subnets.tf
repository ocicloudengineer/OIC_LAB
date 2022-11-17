#primary site
#Subnet pública	172.16.0.1/24
module "subnet_lb_oic_lab_dr" {
  source            = "../../modules/subnet"
  subnet_cidr_block = "172.100.10.0/27"
  compartment_id    = module.compartment_oic_sample_prd_net.id
  vcn_id            = module.vcn_prd_oic.id
  subnet_dns_label  = "sbntlbprodoic"

  #Optional
  display_name                      = "ORA-TCE-${var.environment}-LAB-DR-SUB-PUB"
  subnet_prohibit_public_ip_on_vnic = false
  subnet_security_list_ids          = [module.security-list-oic-lab-dr-subnet-lb.id]

  #Tags
  freeform_tags = {
    "PROJECT"     = "${var.proyecto}"
    "ENTIDAD"     = "${var.environment}"
    "ENVIRONMENT" = "${var.ambiente}"
    "COMPARTMENT" = "ORA_TCE_${var.environment}_${var.ambiente}_LAB_DR_NET"
    "NAME"        = "ORA_TCE_${var.environment}-LAB-DR-SUB-PUB"
  }

}

#Subnet privada	172.16.1.0/24
module "subnet_agent_oic_lab_dr" {
  source            = "../../modules/subnet"
  subnet_cidr_block = "172.100.10.32/27"
  compartment_id    = module.compartment_oic_sample_prd_net.id
  vcn_id            = module.vcn_prd_oic.id
  subnet_dns_label  = "sbntagnprodoic"

  #Optional
  display_name                      = "ORA-TCE-${var.environment}-LAB-DR-SUB-PRI"
  subnet_prohibit_public_ip_on_vnic = true
  subnet_security_list_ids          = [module.security-list-oic-lab-dr-subnet-agent.id]
 
  #Tags
  freeform_tags = {
    "PROJECT"     = "${var.proyecto}"
    "ENTIDAD"     = "${var.environment}"
    "ENVIRONMENT" = "${var.ambiente}"
    "COMPARTMENT" = "ORA_TCE_${var.environment}_LAB_DR_COM_NET"
    "NAME"        = "ORA-TCE-${var.environment}-LAB-DR-SUB-PRI"
  }

}