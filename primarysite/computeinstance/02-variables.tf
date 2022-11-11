variable "tenancy_ocid" {
  description = "OCID de tenancy"
  default     = "ocid1.tenancy.oc1..aaaaaaaa6pe4hloqyznt2fqrhkxzgzcoav2gapapstvwrxbhsij5ne4f2shq"
}

variable "region" {
  default = "us-ashburn-1"
}

variable "region2" {
  default = "us-pheonix-1"
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
  description = "OCID de compartment prinicipal para el Laboratorio"
  default     = "ocid1.compartment.oc1..aaaaaaaatwhzwxo5zzj6cr6yliputc6sv22hibtfl6yg4g3tgo3ycpcin5ya"  #Get after root lab compartment creation - ORA_TCE_OIC_LAB_DR
}

variable "drg_compartment_prd_ocid" {
  description = "OCID de compartment donde se encuentra el DRG a usar"
  default = "ocid1.tenancy.oc1..aaaaaaaa6pe4hloqyznt2fqrhkxzgzcoav2gapapstvwrxbhsij5ne4f2shq"
}

variable "drg_prd_ocid" {
  description = "OCID del DRG DRG a usar"
  default = "ocid1.drg.oc1.iad.aaaaaaaamsbr4pj7bsybbzpqioqecl4ytxeytxhmvjifguqe7pdoev5v237a"
}

variable "networkcompartmentname" {
  default = ""
}

variable "instanceappcompartment" {
  default = ""
}

variable "environmentstname" {
  default = "TCE"
}

variable "app" {
  default = "OIC"
}

variable "resourceapp" {
  default = "AGN"
}

variable instanceshapeapp {
   description = "Shape for Payrroll enviroment apps"
  default     = "VM.Standard.E3.Flex"
}

variable "ad1" {
  description = ""
  default     = "tpiZ:US-ASHBURN-AD-1"
}

variable "ad2" {
  description = ""
  default     = "tpiZ:US-ASHBURN-AD-2"
}

variable "ad3" {
  description = ""
  default     = "tpiZ:US-ASHBURN-AD-3"
}

variable "fd" {
  description = ""
  default     = "FD-1"
}