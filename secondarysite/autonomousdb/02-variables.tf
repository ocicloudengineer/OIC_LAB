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
  default = "ALT"
}

variable "proyecto" {
  default = "LABDRINTEGRATION"
}

variable "configuration" {
  description = "ATP configuration"
  default = [
    {
      "name"      : "LAB-DR-PRD"
    }
  ]
}

variable "parent_lab_dr_compartment_ocid" {
  description = "OCID de compartment prinicipal para el Laboratorio"
  default     = "ocid1.compartment.oc1..aaaaaaaa5qkdnnckczzqpi775wt6dhqf4ooaxvcmmuw45hgiskaihegu7hca"  #Get after root lab compartment creation - ORA_TCE_OIC_LAB_DR
}

variable "autonomous_database_admin_password" {
  default = "Oiclabautodb1234"
}