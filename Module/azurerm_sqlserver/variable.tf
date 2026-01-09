variable "sqlsrv_dev1" {
  description = "A map of SQL Server configurations for development environment"
  type = map(object({
    name                         = string
    location                     = string
    rg_name                      = string
    version                      = string
    administrator_login          = string
    administrator_login_password = string
    tags                         = map(string)
  }))
}