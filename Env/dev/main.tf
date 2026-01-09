module "resource_group" {
  source  = "../../Module/azurerm_resource_group"
  rg_dev1 = var.rg_devB
}

module "virtual_network" {
  source     = "../../Module/azurerm_virtual_network"
  vnet_dev1  = var.vnet_devB
  depends_on = [module.resource_group]
}

module "public_ip" {
  source     = "../../Module/azurerm_public_ip"
  pip_dev1   = var.pip_devB
  depends_on = [module.resource_group]
}

module "network_interface" {
  source     = "../../Module/azurerm_nic"
  nic_dev1   = var.nic_devB
  depends_on = [module.public_ip]

}

module "key_vault" {
  source     = "../../Module/azurerm_keyvault"
  kv_dev1    = var.kv_devB
  depends_on = [module.resource_group]
}

module "key_vault_secrets" {
  source     = "../../Module/azurerm_keyvault_secrets"
  kvs_dev1   = var.kvs_devB
  depends_on = [module.key_vault]
}

module "virtual_machine" {
  source     = "../../Module/azurerm_vm"
  vm_dev1    = var.vm_devB
  depends_on = [module.network_interface]
}

module "sql_server" {
  source      = "../../Module/azurerm_sqlserver"
  sqlsrv_dev1 = var.sqlsrv_devB
  depends_on  = [module.resource_group]
}

module "sql_database" {
  source     = "../../Module/azurerm_sql_database"
  sqldb_dev1 = var.sqldb_devB
  depends_on = [module.sql_server]
}