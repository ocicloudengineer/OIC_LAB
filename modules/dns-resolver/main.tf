terraform {
  required_version = "~> 1.1.4"
  required_providers {
    oci = {
      source  = "hashicorp/oci"
      version = "4.17"
    }
  }
}

resource "oci_dns_resolver" "main" {
  attached_views {
    view_id = data.oci_dns_resolvers.src.resolvers[0].default_view_id
  }
  display_name   = var.display_name
  resolver_id    = data.oci_dns_resolvers.resolver.resolvers[0].id
  scope          = "PRIVATE"
  compartment_id = data.oci_identity_compartments.compartments.compartments[0].id
  freeform_tags  = var.freeform_tags
}
