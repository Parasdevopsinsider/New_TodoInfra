data "azurerm_network_interface" "nic1" {
    for_each = var.vm_dev1
  name                = each.value.nic_name
  resource_group_name = each.value.rg_name
}

output "network_interface_ids" {
  value = { for k, v in data.azurerm_network_interface.nic1 : k => v.id }
}

data "azurerm_key_vault" "kv1" {
    for_each = var.vm_dev1
  name                = each.value.key_vault_name
  resource_group_name = each.value.rg_name
}

output "key_vault_ids" {
  value = { for k, v in data.azurerm_key_vault.kv1 : k => v.id }
}

data "azurerm_key_vault_secret" "kvs1" {
    for_each = var.vm_dev1
  name         = each.value.secret_name
  key_vault_id = data.azurerm_key_vault.kv1[each.key].id
}

output "key_vault_secret_values" {
  value = { for k, v in data.azurerm_key_vault_secret.kvs1 : k => v.value }
}

resource "azurerm_linux_virtual_machine" "vm1" {
    for_each = var.vm_dev1
  name                = each.value.name
  resource_group_name = each.value.rg_name
  location            = each.value.location
  size                = each.value.vm_size
  admin_username      = each.value.admin_username
  admin_password = data.azurerm_key_vault_secret.kvs1[each.key].value
  network_interface_ids = [
    data.azurerm_network_interface.nic1[each.key].id,
  ]
    disable_password_authentication = false

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}