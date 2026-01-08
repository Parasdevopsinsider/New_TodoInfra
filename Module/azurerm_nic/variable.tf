variable "nic_dev1" {
  description = "A map of network interface configurations for development environment"
  type = map(object({
    name                = string
    location            = string
    rg_name             = string
    vnet_name         = string
    pip_name           = string
    ip_configurations = list(object({
      subnet_key = string
      pip_key    = string
    }))
    }))


}