data "oci_identity_compartments" "compartments" {
  #Required
  compartment_id            = "ocid1.tenancy.oc1..aaaaaaaaytihdn7jg2zlgkxi3igokz2fxwegvd33anmqwmvp5wvyhkexd43a"
  compartment_id_in_subtree = true
  filter {
    name   = "state"
    values = ["ACTIVE"]
  }
  filter {
    name   = "name"
    values = [var.compartment_name]
  }
}

data "oci_dns_resolvers" "resolver" {
  compartment_id = data.oci_identity_compartments.compartments.compartments[0].id
  scope          = "PRIVATE"
}

data "oci_identity_compartments" "compartments_src" {
  #Required
  compartment_id            = "ocid1.tenancy.oc1..aaaaaaaaytihdn7jg2zlgkxi3igokz2fxwegvd33anmqwmvp5wvyhkexd43a"
  compartment_id_in_subtree = true
  filter {
    name   = "state"
    values = ["ACTIVE"]
  }
  filter {
    name   = "name"
    values = [var.compartment_src_name]
  }
}

data "oci_dns_resolvers" "src" {
  compartment_id = data.oci_identity_compartments.compartments_src.compartments[0].id
  scope          = "PRIVATE"
}
