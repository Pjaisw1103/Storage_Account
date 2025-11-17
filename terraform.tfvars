strg = {
  strg1 = {
    name                              = "storageaccount001"
    resource_group_name               = "storage_rg"
    location                          = "West Europe"
    account_tier                      = "Standard"
    account_replication_type          = "GRS"
    account_kind                      = "StorageV2"
    provisioned_billing_model_version = "V2"
    cross_tenant_replication_enabled  = false
    access_tier                       = "Hot"
    https_traffic_only_enabled        = true
    min_tls_version                   = "TLS1_2"
    allow_nested_items_to_be_public   = true
    shared_access_key_enabled         = true
    public_network_access_enabled     = true
    default_to_oauth_authentication   = false
    
    network_rules = {
      rule01 = {
        default_action = "Deny"
        ip_rules       = ["100.0.0.1"]
        bypass         = ["AzureServices"]
      }
    }
  }

  strg2 = {
    name                     = "storageaccount002"
    resource_group_name      = "storage_rg"
    location                 = "West Europe"
    account_tier             = "Standard"
    account_replication_type = "GRS"
    # network_rules = {}
  }
}
