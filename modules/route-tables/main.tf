# terraform {
#   required_version = "~> 1.1.4"
#   required_providers {
#     oci = {
#       source  = "hashicorp/oci"
#       version = "4.17"
#     }
#   }
# }

resource "oci_core_route_table" "main" {
  compartment_id = var.compartment_id
  vcn_id         = var.vcn_id

  #Optional
  display_name  = var.display_name
  freeform_tags = var.freeform_tags


  dynamic "route_rules" {
    for_each = var.route_rules
    content {
      network_entity_id = lookup(route_rules.value, "network_entity_id", "")
      destination       = lookup(route_rules.value, "destination", "")
      destination_type  = lookup(route_rules.value, "destination_type", "CIDR_BLOCK")
    }
  }

}

resource "oci_core_route_table_attachment" "main" {
  count          = var.subnet_attach
  subnet_id      = var.subnet_id
  route_table_id = oci_core_route_table.main.id
}
