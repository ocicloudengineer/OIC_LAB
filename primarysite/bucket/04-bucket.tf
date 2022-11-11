module "bucket-dr-lab" {
    tenancy_ocid            = var.tenancy_ocid
    source                  = "../../modules/object-storage"
    compartment_name        = "ORA_${var.environment}_LAB_DR_BUCKET"
    bucket_name             = "ORA_${var.environment}_BUCKET"
    bucket_access_type      = var.bucket_access_type
    bucket_auto_tiering     = var.bucket_auto_tiering
    bucket_storage_tier     = var.bucket_storage_tier
    bucket_versioning       = var.bucket_versioning
    freeform_tags = {
        "PROJECT"     = "${var.proyecto}"
        "ENTIDAD"     = "${var.environment}"
        "ENVIRONMENT" = "${var.ambiente}"
        "COMPARTMENT" = "ORA_${var.environment}_LAB_DR_BUCKET"
        "NAME"        = "ORA_${var.environment}_LAB_DR_BUCKET"
    }
}