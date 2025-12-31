resource "azurerm_virtual_network" "vnet1" {
    for_each = var.vnet_dev1
    name               = each.value.name
    location           = each.value.location
    resource_group_name = each.value.rg_name
    address_space      = each.value.address_space
    tags               = each.value.tags

    dynamic "subnet" {
      for_each = each.value.subnets
      content {
        name           = subnet.value.name
        address_prefixes = subnet.value.address_prefixes
      }
    }
}