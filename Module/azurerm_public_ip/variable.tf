variable "pip_dev1" {
  description = "A map of public IP configurations for development environment"
  type = map(object({
    name              = string
    location          = string
    rg_name           = string
    allocation_method = string
  }))
}