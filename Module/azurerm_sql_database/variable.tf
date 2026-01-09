variable "sqldb_dev1" {
  description = "A map of SQL Database configurations for development environment"
  type = map(object({
    name         = string
    location     = string
    rg_name      = string
    server_name  = string
    collation    = string
    license_type = string
    max_size_gb  = number
    sku_name     = string
    enclave_type = string
    tags         = map(string)
  }))
}
