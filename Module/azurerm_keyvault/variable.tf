variable "kv_dev1" {
    description = "Key Vault Code"
    type = map ( object ({
 name     = string                 
 location  = string                
 rg_name = string               
 sku_name = string                  
 purge_protection_enabled = bool  
 soft_delete_retention_days = number
    }))
}