
variable "strg" {
  type = map(object({
    name                              = string
    resource_group_name               = string
    location                          = string
    account_tier                      = string
    account_replication_type          = string
    account_kind                      = optional(string)
    provisioned_billing_model_version = optional(string)
    cross_tenant_replication_enabled  = optional(bool, false)
    access_tier                       = optional(string)
    https_traffic_only_enabled        = optional(bool, true)
    min_tls_version                   = optional(string)
    allow_nested_items_to_be_public   = optional(bool, true)
    shared_access_key_enabled         = optional(bool, true)
    public_network_access_enabled     = optional(bool, true)
    default_to_oauth_authentication   = optional(bool, false)
    network_rules = optional(map(object({
      default_action = string
      ip_rules       = optional(list(string))
      bypass         = optional(list(string))
      virtual_network_subnet_ids = optional(list(string))
    })),{})
  }))
}
