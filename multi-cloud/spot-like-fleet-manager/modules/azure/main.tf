resource "azurerm_virtual_machine_scale_set" "low_priority_vmss" {
  name                = "${var.name_prefix}-vmss"
  location            = var.location
  resource_group_name = var.resource_group_name
  sku {
    name     = var.vm_size
    tier     = "Standard"
    capacity = var.desired_capacity
  }

  upgrade_policy_mode = "Manual"

  network_profile {
    name    = "${var.name_prefix}-nic"
    primary = true

    ip_configuration {
      name      = "${var.name_prefix}-ipconfig"
      subnet_id = var.subnet_id
    }
  }

  priority          = "Low" # Low Priority VMs
  eviction_policy   = "Deallocate"
  overprovision     = true

  os_profile {
    computer_name_prefix = var.name_prefix
    admin_username       = var.admin_username
    admin_password       = var.admin_password
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }

  storage_profile_image_reference {
    publisher = var.vm_image_publisher
    offer     = var.vm_image_offer
    sku       = var.vm_image_sku
    version   = "latest"
  }

  tags = var.tags
}
