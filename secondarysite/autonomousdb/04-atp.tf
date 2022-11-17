resource "oci_database_autonomous_database" "test_autonomous_database" {
    #Required
    compartment_id = module.compartment_oic_sample_prd_integration.id
    db_name = "OraLab${var.environment}Atp"
    admin_password = var.autonomous_database_admin_password
    data_storage_size_in_tbs = "1"
    #ocpu_count = "1"
    cpu_core_count = "1"
    
}