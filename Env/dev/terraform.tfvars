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


