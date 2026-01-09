rg_devB = {
  rg_dev_1 = {
    rg_name    = "devB-rg-1"
    location   = "West US"
    managed_by = "team-a"
    tags = {
      environment = "development"
      project     = "todo-app"
      owner       = "Paras_DevOps"
    }
  }
}

vnet_devB = {
  vnet_dev_1 = {
    name          = "devB-vnet-1"
    location      = "West US"
    rg_name       = "devB-rg-1"
    address_space = ["10.0.0.0/16"]
    tags = {
      environment = "development"
      project     = "todo-app"
      owner       = "Paras_DevOps"
    }
    subnets = [
      {
        name             = "devB-subnet-1"
        address_prefixes = ["10.0.1.0/24"]
      }
    ]
  }
}

pip_devB = {
  pip_dev_1 = {
    name              = "devB-pip-1"
    location          = "West US"
    rg_name           = "devB-rg-1"
    allocation_method = "Dynamic"
  }
}

nic_devB = {
  nic_dev_1 = {
    name      = "devB-nic-1"
    location  = "West US"
    rg_name   = "devB-rg-1"
    vnet_name = "devB-vnet-1"
    pip_name  = "devB-pip-1"
    ip_configurations = [
      {
        subnet_key = "devB-subnet-1"
        pip_key    = "devB-pip-1"
      }
    ]
  }
}

kv_devB = {
  kv_dev_1 = {
    name                       = "devB-kv-1"
    location                   = "West US"
    rg_name                    = "devB-rg-1"
    sku_name                   = "standard"
    purge_protection_enabled   = false
    soft_delete_retention_days = 7
    tags = {
      environment = "development"
      project     = "todo-app"
      owner       = "Paras_DevOps"
    }
  }
}

kvs_devB = {
  kvs_dev_1 = {
    name           = "VMPassword"
    value          = "Paras@1234"
    key_vault_name = "devB-kv-1"
    rg_name        = "devB-rg-1"
  }
}

vm_devB = {
  vm_dev_1 = {
    name           = "devB-vm-1"
    location       = "West US"
    rg_name        = "devB-rg-1"
    nic_name       = "devB-nic-1"
    key_vault_name = "devB-kv-1"
    secret_name    = "VMPassword"
    vm_size        = "Standard_B1s"
    admin_username = "azureuser"
  }
}

sqlsrv_devB = {
  sqlsrv_dev_1 = {
    name                         = "devbsqlsrv1"
    location                     = "West US"
    rg_name                      = "devB-rg-1"
    administrator_login          = "sqladminuser"
    administrator_login_password = "Paras@1234"
    version                      = "12.0"
    tags = {
      environment = "development"
      project     = "todo-app"
      owner       = "Paras_DevOps"
    }
  }
}

sqldb_devB = {
  sqldb_dev_1 = {
    name         = "devbsqldb1"
    location     = "West US"
    rg_name      = "devB-rg-1"
    server_name  = "devbsqlsrv1"
    collation    = "SQL_Latin1_General_CP1_CI_AS"
    license_type = "LicenseIncluded"
    max_size_gb  = 2
    sku_name     = "Basic"
    enclave_type = "VBS"
    tags = {
      environment = "development"
      project     = "todo-app"
      owner       = "Paras_DevOps"
    }
  }
}