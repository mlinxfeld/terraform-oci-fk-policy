variable "enabled" {
  description = "Whether the module should create IAM resources."
  type        = bool
  default     = true
}

variable "tenancy_ocid" {
  description = "The tenancy OCID where OCI IAM policies and dynamic groups are created."
  type        = string
}

variable "dynamic_group" {
  description = "Optional dynamic group definition. Set to null to skip dynamic group creation."
  type = object({
    name          = string
    description   = string
    matching_rule = string
  })
  default  = null
  nullable = true
}

variable "policies" {
  description = "List of OCI IAM policies to create in the tenancy."
  type = list(object({
    name        = string
    description = string
    statements  = list(string)
  }))
  default = []

  validation {
    condition     = length(var.policies) == length(toset([for policy in var.policies : policy.name]))
    error_message = "Each policy name must be unique."
  }

  validation {
    condition     = alltrue([for policy in var.policies : length(policy.statements) > 0])
    error_message = "Each policy must include at least one statement."
  }
}
