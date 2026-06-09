strg = {
  "prod_storage" = {
    name                     = "stgenericprod001"
    resource_group_name      = "storage_rg"
    location                 = "West Europe"
    account_tier             = "Standard"
    account_replication_type = "GRS"
    account_kind             = "StorageV2"
    access_tier              = "Hot"

    # Optional Security Settings
    https_traffic_only_enabled      = true
    min_tls_version                 = "TLS1_2"
    public_network_access_enabled   = true
    shared_access_key_enabled       = true
    default_to_oauth_authentication = true

    # Network Security Rules
    network_rules = {
      default_action             = "Deny"
      ip_rules                   = ["103.1.1.1"]
      bypass                     = ["AzureServices", "Logging", "Metrics"]
      virtual_network_subnet_ids = []
    }

    # Managed Identity
    identity = {
      type = "SystemAssigned"
    }

    # Blob Service Properties
    blob_properties = {
      versioning_enabled  = true
      change_feed_enabled = true
      delete_retention_policy = {
        days = 14
      }
    }

    # Nested Sub-resources
    containers = {
      "logs" = {
        name                  = "app-logs"
        container_access_type = "private"
      }
      "data" = {
        name                  = "raw-data"
        container_access_type = "blob"
      }
    }

    shares = {
      "files" = {
        name  = "shared-files"
        quota = 50
      }
    }

    tags = {
      Environment = "Production"
      Project     = "GenericStorage"
      ManagedBy   = "Terraform"
    }
  }

  "dev_storage" = {
    name                     = "stgenericdev001"
    resource_group_name      = "storage_rg"
    location                 = "West Europe"
    account_tier             = "Standard"
    account_replication_type = "LRS"
    
    # Minimal config - everything else is optional/defaulted
    tags = {
      Environment = "Development"
    }
  }
}
