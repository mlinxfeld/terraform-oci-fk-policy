output "dynamic_group" {
  description = "The created OCI dynamic group, or null if dynamic group creation is disabled."
  value       = try(oci_identity_dynamic_group.this[0], null)
}

output "dynamic_group_id" {
  description = "The OCID of the created OCI dynamic group, or null if dynamic group creation is disabled."
  value       = try(oci_identity_dynamic_group.this[0].id, null)
}

output "policies" {
  description = "Map of created OCI IAM policies keyed by policy name."
  value       = oci_identity_policy.this
}

output "policy_ids" {
  description = "Map of created OCI IAM policy IDs keyed by policy name."
  value       = { for name, policy in oci_identity_policy.this : name => policy.id }
}
