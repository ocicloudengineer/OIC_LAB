#########################
## OIC
#########################
output "oic" {
  description = "The returned resource attributes for OIC service"
  value       = oci_integration_integration_instance.this
}