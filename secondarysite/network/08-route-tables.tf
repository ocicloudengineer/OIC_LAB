#Route table public subnet
module "route-table-oic-labdr-subnet-lb" {
  source         = "../../modules/route-tables"
  compartment_id =  module.compartment_oic_sample_prd_net.id
  vcn_id         = module.vcn_prd_oic.id
  display_name   = "ORASH-${var.environment}-LAB-DR-RT-PUB"
  subnet_id	 = module.subnet_lb_oic_lab_dr.id

  #Routes
  route_rules = [
     
    /* {
      #### RUTA PARA ACCESO A LA ORACLE SERVICE NETWORK ####      
      network_entity_id = module.service-gateway.id
      destination = "all-iad-services-in-oracle-services-network"
      destination_type = "SERVICE_CIDR_BLOCK"
    } */
    #{
      #### RUTA PARA SALIDA A INTERNET ####
      #network_entity_id = module.vcn_prd_oic.nat_gateway_id
      #destination = "0.0.0.0/0"
      #destination_type = "CIDR_BLOCK"
    #}
    #### DNS ####
  ]
}

#Route table private subnet
module "route-table-oic-labdr-subnet-agents" {
  source         = "../../modules/route-tables"
  compartment_id =  module.compartment_oic_sample_prd_net.id
  vcn_id         = module.vcn_prd_oic.id
  display_name   = "ORASH-${var.environment}-LOY-DEV-RT-PRI"
  subnet_id      = module.subnet_agent_oic_lab_dr.id


  #Routes
  route_rules = [
    /* {
      #### RUTA PARA ACCESO A LA ORACLE SERVICE NETWORK ####  
      network_entity_id = module.service-gateway.id
      destination = "all-iad-services-in-oracle-services-network"
      destination_type = "SERVICE_CIDR_BLOCK"
    }, */
    # AWS Private Customer Cloud
    {
      network_entity_id = module.drg_prd_oic_lab_dr.drg_attach_drg_id
      destination = "172.31.48.0/20"
      destination_type = "CIDR_BLOCK"
    }
    #### DNS ####
   ]
}