#output "compartment_id" {
#  description = "Parent Compartment ID"
##  value       = "oci_identity_compartment.main.compartment_id"
#}

output "description" {
  description = "Compartment Description"
  value       = oci_identity_compartment.main.description
}

output "id" {
  description = "Compartment Id"
  value       = oci_identity_compartment.main.id
}

output "name" {
  description = "Compartment Name"
  value       = oci_identity_compartment.main.name
}


output "state" {
  description = "Compartment State"
  value       = oci_identity_compartment.main.state
}
