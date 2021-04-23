variable "identity_provider_url" {
  type = string
}

variable "audience" {
  type = string
}

variable "workspace_uuid" {
  type = string
}

variable "repository_uuid" {
  type = string
}

variable "environment_uuid" {
  type = string
  default = ""
}

variable "name" {
  type = string
}

variable "oidc_thumbprint" {
  type        = string
  default     = "a031c46782e6e6c662c2c87c76da9aa62ccabd8e"
  description = "Thumbprint of OIDC host. See https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_providers_create_oidc_verify-thumbprint.html"
}