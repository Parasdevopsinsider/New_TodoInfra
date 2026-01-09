variable "kvs_dev1" {
  description = "A map of Key Vault Secret configurations for development environment"
  type = map(object({
    name            = string
    value           = string
    key_vault_name  = string
    rg_name         = string
  }))
}