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

variable "repository_uuid" {
  type = string
  description = "Enter the Repository UUID as displayed in the Bitbucket OpenID Connect Provider page in your repository"
}

variable "environment_uuid" {
  type = string
  default = ""
  description = "Enter the Environment UUID as displayed in the Bitbucket OpenID Connect Provider page in your repository. This is optional, will restrict this role to be used only with the Environment, if defined."
}

variable "role_name" {
  type = string
  description = "Name for the role to be created"
}

variable "oidc_thumbprint" {
  type        = string
  default     = "a031c46782e6e6c662c2c87c76da9aa62ccabd8e"
  description = "Thumbprint of OIDC host. See https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_providers_create_oidc_verify-thumbprint.html"
}