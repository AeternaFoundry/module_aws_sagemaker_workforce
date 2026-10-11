output "sagemaker_workforces_id" {
  description = "Map of id values across all sagemaker_workforces, keyed the same as var.sagemaker_workforces"
  value       = { for k, v in aws_sagemaker_workforce.sagemaker_workforces : k => v.id if v.id != null && length(v.id) > 0 }
}
output "sagemaker_workforces_arn" {
  description = "Map of arn values across all sagemaker_workforces, keyed the same as var.sagemaker_workforces"
  value       = { for k, v in aws_sagemaker_workforce.sagemaker_workforces : k => v.arn if v.arn != null && length(v.arn) > 0 }
}
output "sagemaker_workforces_cognito_config" {
  description = "Map of cognito_config values across all sagemaker_workforces, keyed the same as var.sagemaker_workforces"
  value       = { for k, v in aws_sagemaker_workforce.sagemaker_workforces : k => one(v.cognito_config) if v.cognito_config != null && length(v.cognito_config) > 0 }
}
output "sagemaker_workforces_oidc_config" {
  description = "Map of oidc_config values across all sagemaker_workforces, keyed the same as var.sagemaker_workforces"
  value       = { for k, v in aws_sagemaker_workforce.sagemaker_workforces : k => one(v.oidc_config) if v.oidc_config != null && length(v.oidc_config) > 0 }
  sensitive   = true
}
output "sagemaker_workforces_region" {
  description = "Map of region values across all sagemaker_workforces, keyed the same as var.sagemaker_workforces"
  value       = { for k, v in aws_sagemaker_workforce.sagemaker_workforces : k => v.region if v.region != null && length(v.region) > 0 }
}
output "sagemaker_workforces_source_ip_config" {
  description = "Map of source_ip_config values across all sagemaker_workforces, keyed the same as var.sagemaker_workforces"
  value       = { for k, v in aws_sagemaker_workforce.sagemaker_workforces : k => one(v.source_ip_config) if v.source_ip_config != null && length(v.source_ip_config) > 0 }
}
output "sagemaker_workforces_subdomain" {
  description = "Map of subdomain values across all sagemaker_workforces, keyed the same as var.sagemaker_workforces"
  value       = { for k, v in aws_sagemaker_workforce.sagemaker_workforces : k => v.subdomain if v.subdomain != null && length(v.subdomain) > 0 }
}
output "sagemaker_workforces_workforce_name" {
  description = "Map of workforce_name values across all sagemaker_workforces, keyed the same as var.sagemaker_workforces"
  value       = { for k, v in aws_sagemaker_workforce.sagemaker_workforces : k => v.workforce_name if v.workforce_name != null && length(v.workforce_name) > 0 }
}
output "sagemaker_workforces_workforce_vpc_config" {
  description = "Map of workforce_vpc_config values across all sagemaker_workforces, keyed the same as var.sagemaker_workforces"
  value       = { for k, v in aws_sagemaker_workforce.sagemaker_workforces : k => one(v.workforce_vpc_config) if v.workforce_vpc_config != null && length(v.workforce_vpc_config) > 0 }
}

