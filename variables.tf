variable "sagemaker_workforces" {
  description = <<EOT
Map of sagemaker_workforces, attributes below
Required:
    - workforce_name
Optional:
    - region
    - cognito_config (block):
        - client_id (required)
        - user_pool (required)
    - oidc_config (block):
        - authentication_request_extra_params (optional)
        - authorization_endpoint (required)
        - client_id (required)
        - client_secret (required)
        - issuer (required)
        - jwks_uri (required)
        - logout_endpoint (required)
        - scope (optional)
        - token_endpoint (required)
        - user_info_endpoint (required)
    - source_ip_config (block):
        - cidrs (required)
    - workforce_vpc_config (block):
        - security_group_ids (optional)
        - subnets (optional)
        - vpc_id (optional)
EOT

  type = map(object({
    workforce_name = string
    region         = optional(string)
    cognito_config = optional(object({
      client_id = string
      user_pool = string
    }))
    oidc_config = optional(object({
      authentication_request_extra_params = optional(map(string))
      authorization_endpoint              = string
      client_id                           = string
      client_secret                       = string
      issuer                              = string
      jwks_uri                            = string
      logout_endpoint                     = string
      scope                               = optional(string)
      token_endpoint                      = string
      user_info_endpoint                  = string
    }))
    source_ip_config = optional(object({
      cidrs = set(string)
    }))
    workforce_vpc_config = optional(object({
      security_group_ids = optional(set(string))
      subnets            = optional(set(string))
      vpc_id             = optional(string)
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.sagemaker_workforces : (
        (length(v.workforce_name) >= 1 && length(v.workforce_name) <= 63) && (can(regex("^[0-9A-Za-z]([0-9A-Za-z-])*$", v.workforce_name)))
      )
    ])
    error_message = "all of: must be between 1 and 63 characters; Valid characters are a-z, A-Z, 0-9, and - (hyphen)."
  }
  # Note: 9 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

