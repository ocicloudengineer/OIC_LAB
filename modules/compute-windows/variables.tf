variable "instance_number" {
  description = "Numero de instancias que serão provisionadas"
}

variable "tenancy_ocid" {}

variable "instance_compartment_name" {
  default = ""
}

variable "instance_compartment_id" {
  default = ""
}

variable "vcn_compartment_id" {
  default = ""
}

variable "nsg_ids" {
  default = [""]
}

variable "nsg_name" {
  default = ""
}
variable "increment_label_start" {
  default = "1"
}

variable "increment_label" {
  default = true
}

variable "compartment_id" {
  description = "Compartment ID"
  default     = ""
}

variable "region" {
  description = "Região que será criada"
}

variable "display_name" {
  description = "O nome de exibição da Instancia"
}

variable "instance_shape" {
  description = "O Shape da Instancia"
}

variable "oci_identity_availability_domain" {
  description = "O dominio de disponibilidade"
}

variable "instance_is_pv_encryption_in_transit_enabled" {
  default = ""
}

#variable "boot_volume_size_in_gbs" {
#  description = "Tamanho do volume de boot em gigabytes. APENAS NUMEROS"
#}

variable "assign_public_ip" {
  description = "Determina se um ip publico deve ser atribuido a instancia"
  type        = bool
}

variable "custom_display_name" {
  type        = list(string)
  default     = [""]
  description = "Nome Custom"
}

variable "custom_name" {
  type        = bool
  default     = false
  description = "No Custom Name"
}

variable "instance_user" {
  type        = string
  default     = "opc"
  description = "Nome do usuário padrão do Windows"
}
/*
variable "fault_domain" {
  type        = list
  default     = [""]
  description = "Fault Domains"
}
*/

variable "cloudinit_ps1" {
  default = "cloudinit.ps1"
}

variable "cloudinit_config" {
  default = "cloudinit.yml"
}

variable "subnet_dns_enable" {
  type        = bool
  default     = true
  description = "If Subnet DNS is enabled"
}

variable "block_vol_backup" {
  default = "gold"
}

variable "disk_volume" {
  type        = list(any)
  default     = []
  description = "Volume de Disco"
}

variable "disk_volume_letter" {
  type        = string
  default     = "D"
  description = "Disk Volume Letter"
}

variable "disk_volume_ipv4" {
  type    = list(any)
  default = []
}

variable "disk_volume_iqn" {
  type    = list(any)
  default = []
}

variable "disk_volume_label" {
  type    = string
  default = "Disco D"
}

#variable "nsg_ids" {
#  type    = "list"
#  default = []
#}

variable "use_private_ip_for_ssh" {
  description = "Determina se o ip privado sera usado para remote execs."
  default     = "true"
}

# If your image does not have winrm enabled, please follow steps above to configure it
# The remote-exec-windows resource will only execute if this is set to true
variable "IsWinRMConfiguredForImage" {
  default = "true"
}

# Use the https 5986 port for winrm by default
# If that fails with a http response error: 401 - invalid content type, the SSL may not be configured correctly
# In that case you can switch to http 5985 by setting this to false, and configuring winrm to AllowUnencrypted traffic
variable "IsWinRMConfiguredForSSL" {
  default = "true"
}

variable "image_id" {
  type    = string
  default = "ocid1.image.oc1.sa-saopaulo-1.aaaaaaaaq6jxv2vkhpeaizfm5cabhkx5oobhrhlb76nbu6ne3epbemm6pqbq"
}

variable "network_compartment_name" {
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

variable "freeform_tags" {
  type        = map(any)
  default     = {}
  description = "Free-form tags for this resource."
}

variable "vcn_id" {
  description = "O nome da VCN da instancia, use o vcn_id ou o vcn_name"
  default     = ""
}
