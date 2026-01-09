data "azurerm_key_vault" "kv1" {
    for_each = var.kvs_dev1
    name                = each.value.key_vault_name
    resource_group_name = each.value.rg_name
}

resource "azurerm_key_vault_secret" "kvs1" {
    for_each = var.kvs_dev1
    name         = each.value.name
    value        = each.value.value
    key_vault_id = data.azurerm_key_vault.kv1[each.key].id
}