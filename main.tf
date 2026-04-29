locals {
  create_dynamic_group = var.enabled && var.dynamic_group != null

  policies_by_name = var.enabled ? {
    for policy in var.policies : policy.name => policy
  } : {}
}

resource "oci_identity_dynamic_group" "this" {
  count = local.create_dynamic_group ? 1 : 0

  compartment_id = var.tenancy_ocid
  name           = var.dynamic_group.name
  description    = var.dynamic_group.description
  matching_rule  = var.dynamic_group.matching_rule
}

resource "oci_identity_policy" "this" {
  for_each = local.policies_by_name

  compartment_id = var.tenancy_ocid
  name           = each.value.name
  description    = each.value.description
  statements     = each.value.statements
}
