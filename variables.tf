
variable "strg" {
  description = "Map of storage account configurations"
  type = map(object({
    # Required Arguments
    name                     = string
    resource_group_name      = string
    location                 = string
    account_tier             = string
    account_replication_type = string

    # Optional Arguments (Storage Account)
    account_kind                      = optional(string, "StorageV2")
    access_tier                       = optional(string, "Hot")
    https_traffic_only_enabled        = optional(bool, true)
    min_tls_version                   = optional(string, "TLS1_2")
    allow_nested_items_to_be_public   = optional(bool, true)
    shared_access_key_enabled         = optional(bool, true)
    public_network_access_enabled     = optional(bool, true)
    default_to_oauth_authentication   = optional(bool, false)
    is_hns_enabled                    = optional(bool, false) # For Data Lake Gen2
    nfsv3_enabled                     = optional(bool, false)
    cross_tenant_replication_enabled  = optional(bool, false)
    edge_zone                         = optional(string)
    infrastructure_encryption_enabled = optional(bool, false)

    # Dynamic Blocks
    network_rules = optional(object({
      default_action             = string
      ip_rules                   = optional(list(string), [])
      bypass                     = optional(list(string), ["AzureServices"])
      virtual_network_subnet_ids = optional(list(string), [])
    }))

    identity = optional(object({
      type         = string
      identity_ids = optional(list(string))
    }))

    blob_properties = optional(object({
      versioning_enabled  = optional(bool, false)
      change_feed_enabled = optional(bool, false)
      delete_retention_policy = optional(object({
        days = optional(number, 7)
      }))
    }))

    # Sub-resources (Generic)
    containers = optional(map(object({
      name                  = string
      container_access_type = optional(string, "private")
    })), {})

    shares = optional(map(object({
      name  = string
      quota = number
    })), {})

    queues = optional(map(object({
      name = string
    })), {})

    tables = optional(map(object({
      name = string
    })), {})

    tags = optional(map(string), {})
  }))
}
