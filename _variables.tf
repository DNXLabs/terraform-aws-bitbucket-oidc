variable "identity_provider_url" {
  type        = string
  description = "Enter the Identity Provider URL as displayed in the Bitbucket OpenID Connect Provider page in your repository"
}

variable "audience" {
  type        = string
  description = "Enter the Identity Provider Audience as displayed in the Bitbucket OpenID Connect Provider page in your repository"
}

variable "workspace_uuid" {
  type        = string
  description = "Enter the Workspace UUID as displayed in the Bitbucket OpenID Connect Provider page in your repository"
}

variable "roles" {
  type        = list
  default     = []
  description = "List of roles to create, format: [{ name: <role_name>, conditions: <conditions> }, {...}]"
}

variable "oidc_thumbprint" {
  type        = string
  default     = "a031c46782e6e6c662c2c87c76da9aa62ccabd8e"
  description = "Thumbprint of OIDC host. See https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_providers_create_oidc_verify-thumbprint.html"
}