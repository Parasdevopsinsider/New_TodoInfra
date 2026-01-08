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