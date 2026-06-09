# --- Storage Account Resource ---
resource "azurerm_storage_account" "example" {
  for_each = var.strg

  name                     = each.value.name
  resource_group_name      = each.value.resource_group_name
  location                 = each.value.location
  account_tier             = each.value.account_tier
  account_replication_type = each.value.account_replication_type
  account_kind             = each.value.account_kind
  access_tier              = each.value.access_tier

  https_traffic_only_enabled        = each.value.https_traffic_only_enabled
  min_tls_version                   = each.value.min_tls_version
  allow_nested_items_to_be_public   = each.value.allow_nested_items_to_be_public
  shared_access_key_enabled         = each.value.shared_access_key_enabled
  public_network_access_enabled     = each.value.public_network_access_enabled
  default_to_oauth_authentication   = each.value.default_to_oauth_authentication
  is_hns_enabled                    = each.value.is_hns_enabled
  nfsv3_enabled                     = each.value.nfsv3_enabled
  cross_tenant_replication_enabled  = each.value.cross_tenant_replication_enabled
  edge_zone                         = each.value.edge_zone
  infrastructure_encryption_enabled = each.value.infrastructure_encryption_enabled

  dynamic "network_rules" {
    for_each = each.value.network_rules != null ? [each.value.network_rules] : []
    content {
      default_action             = network_rules.value.default_action
      ip_rules                   = network_rules.value.ip_rules
      bypass                     = network_rules.value.bypass
      virtual_network_subnet_ids = network_rules.value.virtual_network_subnet_ids
    }
  }

  dynamic "identity" {
    for_each = each.value.identity != null ? [each.value.identity] : []
    content {
      type         = identity.value.type
      identity_ids = identity.value.identity_ids
    }
  }

  dynamic "blob_properties" {
    for_each = each.value.blob_properties != null ? [each.value.blob_properties] : []
    content {
      versioning_enabled  = blob_properties.value.versioning_enabled
      change_feed_enabled = blob_properties.value.change_feed_enabled

      dynamic "delete_retention_policy" {
        for_each = blob_properties.value.delete_retention_policy != null ? [blob_properties.value.delete_retention_policy] : []
        content {
          days = delete_retention_policy.value.days
        }
      }
    }
  }

  tags = each.value.tags
}

# --- Locals for Flattening Sub-resources ---
locals {
  containers = flatten([
    for s_key, s_val in var.strg : [
      for c_key, c_val in s_val.containers : {
        id                   = "${s_key}.${c_key}"
        storage_account_name = s_val.name
        name                 = c_val.name
        access_type          = c_val.container_access_type
        s_key                = s_key
      }
    ]
  ])

  shares = flatten([
    for s_key, s_val in var.strg : [
      for sh_key, sh_val in s_val.shares : {
        id                   = "${s_key}.${sh_key}"
        storage_account_name = s_val.name
        name                 = sh_val.name
        quota                = sh_val.quota
        s_key                = s_key
      }
    ]
  ])

  queues = flatten([
    for s_key, s_val in var.strg : [
      for q_key, q_val in s_val.queues : {
        id                   = "${s_key}.${q_key}"
        storage_account_name = s_val.name
        name                 = q_val.name
        s_key                = s_key
      }
    ]
  ])

  tables = flatten([
    for s_key, s_val in var.strg : [
      for t_key, t_val in s_val.tables : {
        id                   = "${s_key}.${t_key}"
        storage_account_name = s_val.name
        name                 = t_val.name
        s_key                = s_key
      }
    ]
  ])
}

# --- Sub-resources Implementation ---
resource "azurerm_storage_container" "generic" {
  for_each = { for c in local.containers : c.id => c }

  name                  = each.value.name
  storage_account_name  = azurerm_storage_account.example[each.value.s_key].name
  container_access_type = each.value.access_type
}

resource "azurerm_storage_share" "generic" {
  for_each = { for s in local.shares : s.id => s }

  name                 = each.value.name
  storage_account_name = azurerm_storage_account.example[each.value.s_key].name
  quota                = each.value.quota
}

resource "azurerm_storage_queue" "generic" {
  for_each = { for q in local.queues : q.id => q }

  name                 = each.value.name
  storage_account_name = azurerm_storage_account.example[each.value.s_key].name
}

resource "azurerm_storage_table" "generic" {
  for_each = { for t in local.tables : t.id => t }

  name                 = each.value.name
  storage_account_name = azurerm_storage_account.example[each.value.s_key].name
}
