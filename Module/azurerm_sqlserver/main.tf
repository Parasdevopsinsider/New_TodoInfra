resource "azurerm_mssql_server" "sqlsrv1" {
    for_each = var.sqlsrv_dev1
    name                         = each.value.name
    location                     = each.value.location
    resource_group_name          = each.value.rg_name
    version                      = each.value.version
    administrator_login          = each.value.administrator_login
    administrator_login_password = each.value.administrator_login_password
    tags                         = each.value.tags
}