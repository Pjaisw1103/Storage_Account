resource "azurerm_storage_account" "example" {
  for_each = var.strg

  name                              = each.value.name
  resource_group_name               = each.value.resource_group_name
  location                          = each.value.location
  account_tier                      = each.value.account_tier
  account_replication_type          = each.value.account_replication_type
  account_kind                      = each.value.account_kind
  provisioned_billing_model_version = each.value.provisioned_billing_model_version
  cross_tenant_replication_enabled  = each.value.cross_tenant_replication_enabled
  access_tier                       = each.value.access_tier
  https_traffic_only_enabled        = each.value.https_traffic_only_enabled
  min_tls_version                   = each.value.min_tls_version
  allow_nested_items_to_be_public   = each.value.allow_nested_items_to_be_public
  shared_access_key_enabled         = each.value.shared_access_key_enabled
  public_network_access_enabled     = each.value.public_network_access_enabled
  default_to_oauth_authentication   = each.value.default_to_oauth_authentication

  dynamic "network_rules" {
    for_each = each.value.network_rules
    content {
      default_action = network_rules.value.default_action
      ip_rules       = network_rules.value.ip_rules
      bypass         = network_rules.value.bypass
      virtual_network_subnet_ids = network_rules.value.virtual_network_subnet_ids
      
    }
  }
}
