variable "tenancy_ocid" {
  description = "OCID de tenancy"
  default     = "ocid1.tenancy.oc1..aaaaaaaa6pe4hloqyznt2fqrhkxzgzcoav2gapapstvwrxbhsij5ne4f2shq"
}

variable "region" {
  default = "us-ashburn-1"
}

variable "environment" {
  default = "OIC"
}

variable "ambiente" {
  default = "PRD"
}

variable "proyecto" {
  default = "LABDRINTEGRATION"
}

variable "parent_lab_dr_compartment_ocid" {
  description = "OCID de compartment para el Laboratorio"
  default     = "ocid1.compartment.oc1..aaaaaaaatwhzwxo5zzj6cr6yliputc6sv22hibtfl6yg4g3tgo3ycpcin5ya"  #Get after root lab compartment creation
}

variable "drg_compartment_prd_ocid" {
  default = "ocid1.compartment.oc1..aaaaaaaaphwwg73qdqeihou5vpdo4wqqcpaxwubyopb3ws7pmqga4axf3pea"
}

variable "drg_prd_ocid" {
  default = "ocid1.drg.oc1.iad.aaaaaaaamsbr4pj7bsybbzpqioqecl4ytxeytxhmvjifguqe7pdoev5v237a"
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