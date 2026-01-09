variable "vm_dev1" {
  description = "A map of virtual machine configurations for development environment"
  type = map(object({
    name                 = string
    location             = string
    rg_name              = string
    nic_name             = string
    key_vault_name       = string
    secret_name          = string
    vm_size              = string
    admin_username       = string
  }))
}