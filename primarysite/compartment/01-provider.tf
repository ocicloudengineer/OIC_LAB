#Terraform Provider
terraform {
  backend "s3" {
    bucket                      = "oiclabdrsample"
    key                         = "primarysite/compartment/oic_sample_compartment.tfstate"
    region                      = "us-ashburn-1"
    endpoint                    = "https://idikzonisftg.compat.objectstorage.us-ashburn-1.oraclecloud.com"
    skip_region_validation      = true
    skip_credentials_validation = true
    skip_metadata_api_check     = true
    force_path_style            = true
  }
}