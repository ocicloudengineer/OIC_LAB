/* module "drg_oic_lab_dr" {
    #Required
	source = "../../modules/dynamic-routing-gateway"
    compartment_id = module.compartment_oic_sample_prd_net.id
    drg_display_name = "ORA-TEC-${var.environment}-LAB-DR-DRG"
	vcn_id = module.vcn_prd_oic.id
} */

module "drg_prd_oic_lab_dr" {
	source = "../../modules/dynamic-routing-gateway-only-attach"
	compartment_id = module.compartment_oic_sample_prd_net.id
	drg_display_name = "ORA-TEC-${var.environment}-LAB-DR-DRG"
	vcn_id = module.vcn_prd_oic.id
	drg_id = var.drg_prd_ocid
	drg_attach_display_name = "ORA-TEC-${var.environment}-LAB-DR-DRG-ATT01"
}