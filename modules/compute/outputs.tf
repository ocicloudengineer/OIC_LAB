output "instance_public_ip" {
  description = "O ip Publico da instancia"
  value       = oci_core_instance.instance.*.public_ip
}

output "instance_private_ip" {
  description = "O ip privado da instancia"
  value       = oci_core_instance.instance.*.private_ip
}

output "instance_id" {
  description = "O ID da instancia"
  value       = oci_core_instance.instance.*.id
}

output "instance_display_name" {
  description = "O nome de exibição da instancia"
  value       = oci_core_instance.instance.*.display_name
}
output "boot_volume_id" {
  description = "O ID do volume de boot da instancia"
  value       = oci_core_instance.instance.*.boot_volume_id
}

output "outputs" {
  description = "User, chave privada e ip privado da instancia"
  value = {
    username    = var.ssh_user
    private_key = var.ssh_private_key
    private_ip  = [oci_core_instance.instance.*.private_ip]
    public_ip   = [oci_core_instance.instance.*.public_ip]
  }
}