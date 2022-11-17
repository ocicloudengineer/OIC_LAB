variable "tenancy_ocid" {
  description = "OCID de tenancy"
  default     = "ocid1.tenancy.oc1..aaaaaaaa6pe4hloqyznt2fqrhkxzgzcoav2gapapstvwrxbhsij5ne4f2shq"
}

variable "region" {
  default = "us-phoenix-1"
}

variable "environment" {
  default = "OIC"
}

variable "ambiente" {
  default = "ALT"
}

variable "proyecto" {
  default = "LABDRINTEGRATION"
}

variable "parent_lab_dr_compartment_ocid" {
  description = "OCID de compartment para el Laboratorio"
  default     = "ocid1.compartment.oc1..aaaaaaaa5qkdnnckczzqpi775wt6dhqf4ooaxvcmmuw45hgiskaihegu7hca"  #Get after root lab compartment creation
}

variable "drg_compartment_prd_ocid" {
  default = "ocid1.compartment.oc1..aaaaaaaaphwwg73qdqeihou5vpdo4wqqcpaxwubyopb3ws7pmqga4axf3pea"
}

variable "drg_prd_ocid" {
  default = "ocid1.drg.oc1.phx.aaaaaaaa4fiu4oewjtivly4opex6ie6haauldjn5yj5mrauf4zal6fsdey2q"
}

variable "zone_name" {
  default = "labdrOIC.com"
}

variable "zone_type" {
  default = "PRIMARY"
}

variable "drg_display_name" {
  default = "LAB_DR_DRG"
}