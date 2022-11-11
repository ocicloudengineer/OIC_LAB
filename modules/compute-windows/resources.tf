# Generate a new strong password for your instance
resource "random_string" "instance_password" {
  # Password must be 9 to 30 characters and contain at least 2 uppercase, 2 lowercase, 2 special, and 2 numeric characters. The special characters must be _, #, or -.
  length           = 16
  min_upper        = 2
  min_lower        = 2
  special          = true
  min_special      = 2
  override_special = "#_-"
  min_numeric      = 2
}

resource "null_resource" "wait_for_cloudinit" {
  depends_on = [
    oci_core_instance.instance
  ]

  count = var.IsWinRMConfiguredForImage == "true" ? var.instance_number : 0

  # WinRM configuration through cloudinit may not have completed and password may not have changed yet, so sleep before doing remote-exec
  # WinRM configuration through cloudinit may not have completed and password may not have changed yet, so sleep before doing remote-exec
  provisioner "local-exec" {
    command = "sleep 60"
  }
}

resource "null_resource" "remote-exec-windows" {
  # Although we wait on the wait_for_cloudinit resource, the configuration may not be complete, if this step fails please retry
  depends_on = [
    oci_core_instance.instance,
    null_resource.wait_for_cloudinit,
  ]

  # WinRM connections via Terraform are going to fail if it is not configured correctly as mentioned in comment section above
  count = var.disk_volume != "" && var.IsWinRMConfiguredForImage == "true" && var.custom_name == false ? length(var.disk_volume) : 0

  provisioner "file" {
    connection {
      type    = "winrm"
      agent   = false
      timeout = "1m"
      host    = element(oci_core_instance.instance.*.private_ip, count.index)
      user = element(
        data.oci_core_instance_credentials.InstanceCredentials.*.username,
        count.index,
      )
      password = random_string.instance_password.result
      port     = var.IsWinRMConfiguredForSSL == "true" ? 5986 : 5985
      https    = var.IsWinRMConfiguredForSSL
      insecure = "true" #self-signed certificate
    }

    content     = element(data.template_file.setup_ps1.*.rendered, count.index)
    destination = "c:/setup.ps1"
  }

  provisioner "remote-exec" {
    connection {
      type    = "winrm"
      agent   = false
      timeout = "1m"
      host    = element(oci_core_instance.instance.*.private_ip, count.index)
      user = element(
        data.oci_core_instance_credentials.InstanceCredentials.*.username,
        count.index,
      )
      password = random_string.instance_password.result
      port     = var.IsWinRMConfiguredForSSL == "true" ? 5986 : 5985
      https    = var.IsWinRMConfiguredForSSL
      insecure = "true" #self-signed certificate
    }

    inline = [
      "powershell.exe -file c:/setup.ps1",
    ]
  }
}
