variable "tenancy_ocid" {
  description = "OCID do compartment"
}
variable "instance_number" {
  description = "Numero de instancias que serão provisionadas"
  default     = "1"
}

variable "network_type" {
  default = "PARAVIRTUALIZED"
}

variable "fault_domain" {
  type        = list(any)
  default     = ["1"]
  description = "Fault Domains"
}

variable "instance_is_pv_encryption_in_transit_enabled" {
  default = "false"
}

variable "images" {
  default     = []
  description = "Specific image for each instance, useful to recover backup to instance"
}


variable "hostname_label" {
  description = "O nome de host da Instancia"
  default     = null
}

variable "configure" {
  default = true
}

variable "subnet_name" {
  description = "O nome da subnet da instancia, use o subnet_id ou o subnet_name"
  default     = ""
}

variable "subnet_id" {
  description = "O id da subnet, use o subnet_id ou o subnet_name"
  default     = ""
}

variable "vcn_name" {
  description = "O nome da VCN da instancia, use o vcn_id ou o vcn_name"
  default     = ""
}

variable "vcn_id" {
  description = "O nome da VCN da instancia, use o vcn_id ou o vcn_name"
  default     = ""
}

variable "flex_shape_memory" {
  description = "Cantidade de memoria"
  default     = null
}
variable "flex_shape_ocpus" {
  description = "Cantidade de ocpus"
  default     = null
}

variable "ssh_user" {
  description = "O usuário padrão da Imagem de SO utilizada"
  default     = "opc"
}


variable "availability_domain" {
  description = "Lista com os Availability Domains."
  default     = "VynW:US-ASHBURN-AD-1"
}

variable "instance_compartment_name" {
  description = "Nome do compartment, usar ou o instance_compartment_id ou o instance_compartment_name"
  default     = ""
}

variable "instance_compartment_id" {
  description = "ID do compartment, usar ou o instance_compartment_id ou o instance_compartment_name"
  default     = ""
}

variable "vcn_compartment_name" {
  description = "Nome do compartment, usar ou o vcn_compartment_id ou o vcn_compartment_name"
  default     = ""
}

variable "vcn_compartment_id" {
  description = "ID do compartment, usar ou o vcn_compartment_id ou o vcn_compartment_name"
  default     = ""
}

variable "private_ip" {
  description = "Ip privado das instancias, deixar default para ip automatico ou passar valores em lista."
  type        = list(any)
  default     = [""]
}

variable "assign_public_ip" {
  description = "Determina se um ip publico deve ser atribuido a instancia"
  default     = "false"
}

#variable "nsg_ids" {
#  type    = "list"
#  default = []
#}

variable "nsg_name" {
  type    = string
  default = ""
}

variable "use_private_ip_for_ssh" {
  description = "Determina se o ip privado sera usado para remote execs."
  default     = true
}

variable "freeform_tags" {
  type        = map(any)
  default     = {}
  description = "Free-form tags for this resource."
}

variable "image_id" {
  type = map(any)

  default = {
    ap-mumbai-1    = "ocid1.image.oc1.ap-mumbai-1.aaaaaaaajc74fbcjvb6fm55ij6pfi6fgp6t4r4axfwbh3hkb6fjwpvt64xta"
    ap-seoul-1     = "ocid1.image.oc1.ap-seoul-1.aaaaaaaacdrxj4ktv6qilozzc7bkhcrdlzri2gw4imlljpg255stxvkbgpnq"
    ap-sydney-1    = "ocid1.image.oc1.ap-sydney-1.aaaaaaaazxqgyblayejmgoabszoc7psza3hyf33z4ovyw4v74zbke6vnufia"
    ap-tokyo-1     = "ocid1.image.oc1.ap-tokyo-1.aaaaaaaasd7bfo4bykdf3jlb7n5j46oeqxwj2r3ub4ly36db3pmrlmlzzv3a"
    ca-toronto-1   = "ocid1.image.oc1.ca-toronto-1.aaaaaaaa3i4wzxnwlfgizjv4usrz2fh7dhgolp5dmrmmqcm4i7bdhkbdracq"
    eu-frankfurt-1 = "ocid1.image.oc1.eu-frankfurt-1.aaaaaaaax3xjmpwufw6tucuoyuenletg74sdsj5f2gzsvlv4mqbbgeokqzsq"
    eu-zurich-1    = "ocid1.image.oc1.eu-zurich-1.aaaaaaaa5cd4xnyw6udl5u7v7acgpc4a3xpkwirk7xg2oliq53ea2gmrqheq"
    sa-saopaulo-1  = "ocid1.image.oc1.sa-saopaulo-1.aaaaaaaacvzqswlkixoj4mmhyvxajburto5ulbicbh4pssfgqf5efmsowqga"
    uk-london-1    = "ocid1.image.oc1.uk-london-1.aaaaaaaaokbcnsqwbrgz2wiif2s452u2a4o674tnjsamja5rhtpml5a7sana"
    us-ashburn-1   = "ocid1.image.oc1.iad.aaaaaaaasorq3smbazoxvyqozz52ch5i5cexjojb7qvcefa5ubij2yjycy2a"
    us-langley-1   = "ocid1.image.oc2.us-langley-1.aaaaaaaad225yfhwxrkt4aprxf6erfhtiubrrq3ythktnuv4vu5lzgqowgsa"
    us-luke-1      = "ocid1.image.oc2.us-luke-1.aaaaaaaat37ujafbrdcdfirlfhwzsozyp4lnvzbv2ubiy2p6ob6q3lekpgjq"
    us-phoenix-1   = "ocid1.image.oc1.phx.aaaaaaaaa3vjdblyvw6rlz3jhjxudf6dpqsazqfynn3ziqrxyfox2wq5bdaq"
  }
}

## reglas de autoscaling

variable instance_config_template_onoff {
  type = map(any)

  default = {
    instance_details = {
      block_volumes = {
        attach_details = {
          device       = "/dev/oracleoci/oraclevdb"
          display_name = "Instance_config_grupo_04_1_compute-SDB"
          is_read_only = "false"
          is_shareable = "false"
          type         = "iscsi"
        }
        create_details = {
          size_in_gbs = "100"
          vpus_per_gb = "10"
        }
      }
      instance_type = "compute"
    }
  }
}