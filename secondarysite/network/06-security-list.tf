# Copyright (c) 2020 Oracle and/or its affiliates.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.
#CPE address:  3.228.68.88
# 172.31.48.0/20 IP subnet AWS

module "security-list-oic-lab-dr-subnet-lb" {

  source                 = "../../modules/security-list-new"
  default_compartment_id = module.compartment_oic_sample_prd_net.id
  vcn_id                 = module.vcn_prd_oic.id

  security_lists =  {
    ORA-TEC-OIC-LAB-DR-SLI-PUB = {
      compartment_id = null
      defined_tags   = null
      freeform_tags  = null
      ingress_rules = [ 
          {
          stateless = false
          descriptionrule = "Ingress 4430 desde Bus"
          protocol  = "6"
          src       = "172.31.48.0/20"
          src_type  = "CIDR_BLOCK"
          src_port  = null
          dst           = null
          dst_type      = null
          dst_port = {
            min = 4430
            max = 4430
          }
          icmp_type = null
          icmp_code = null
        }
      ]
      egress_rules   = [
        {
          stateless = false
          descriptionrule = "Salida hacia AGENTS"
          protocol  = "6"
          src       = null
          src_type  = null
          src_port  = null
          dst           = "172.100.10.32/27"
          dst_type      = "CIDR_BLOCK"
          dst_port = {
            min = 30000
            max = 32767
          }
          icmp_type = null
          icmp_code = null
        },
        {
          stateless = false
          descriptionrule = "Salida hacia AGENTS"
          protocol  = "1"
          src       = null
          src_type  = null
          src_port  = null
          dst           = "172.100.10.32/27"
          dst_type      = "CIDR_BLOCK"
          dst_port = {
            min = 30000
            max = 32767
          }
          icmp_type = null
          icmp_code = null
        },
        {
          stateless = false
          descriptionrule = "Salida hacia AGENTS"
          protocol  = "17"
          src       = null
          src_type  = null
          src_port  = null
          dst           = "172.100.10.32/27"
          dst_type      = "CIDR_BLOCK"
          dst_port = {
            min = 30000
            max = 32767
          }
          icmp_type = null
          icmp_code = null
        }
      ]
    }
  }
}

module "security-list-oic-lab-dr-subnet-agent" {
  source                 = "../../modules/security-list-new"
  default_compartment_id = module.compartment_oic_sample_prd_net.id
  vcn_id                 = module.vcn_prd_oic.id

  security_lists = {
    ORA-TEC-OIC-LAB-DR-SLI-PRI = {
      compartment_id = null
      defined_tags   = null
      freeform_tags  = null
      ingress_rules = [
        {
          stateless = false
          descriptionrule = "Ingreso desde LB"
          protocol  = "6"
          src       = "172.100.10.0/27"
          src_type  = "CIDR_BLOCK"
          src_port  = null
          dst       = null
          dst_type  = null
          dst_port  = {
            min = 30000
            max = 32767
          }
          icmp_type = null
          icmp_code = null
        },
        {
          stateless = false
          descriptionrule = "Ingreso desde LB"
          protocol  = "17"
          src       = "172.100.10.0/27"
          src_type  = "CIDR_BLOCK"
          src_port  = null
          dst       = null
          dst_type  = null
          dst_port  = {
            min = 30000
            max = 32767
          }
          icmp_type = null
          icmp_code = null
        },
        ####  DNS y LDAP ####
      ]
      egress_rules = [
        {
          stateless = false
          descriptionrule = "Egress full a servicios de oracle"
          protocol  = "all"
          src       = null
          src_type  = null
          src_port  = null
          dst           = "all-phx-services-in-oracle-services-network"
          dst_type      = "SERVICE_CIDR_BLOCK"
          dst_port  = null
          icmp_type = null
          icmp_code = null
        }
      ]
    }
  }
}