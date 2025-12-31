variable "vnet_dev1" {
  description = "A map of virtual network configurations for development environment"
  type = map(object({
    name               = string
    location           = string
    rg_name            = string
    address_space      = list(string)
    tags               = map(string)
    subnets            = list(object({
      name             = string
      address_prefixes = list(string)
    }))
  }))
}