module "resource_group" {
  source  = "../../Module/azurerm_resource_group"
  rg_dev1 = var.rg_devB
}