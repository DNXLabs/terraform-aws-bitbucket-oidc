# terraform-aws-bitbucket-oidc

[![Lint Status](https://github.com/DNXLabs/terraform-aws-bitbucket-oidc/workflows/Lint/badge.svg)](https://github.com/DNXLabs/terraform-aws-bitbucket-oidc/actions)
[![LICENSE](https://img.shields.io/github/license/DNXLabs/terraform-aws-bitbucket-oidc)](https://github.com/DNXLabs/terraform-aws-bitbucket-oidc/blob/master/LICENSE)

This module sets up IAM Roles and Identity Provider for Bitbucket OIDC.

More info: https://support.atlassian.com/bitbucket-cloud/docs/deploy-on-aws-using-bitbucket-pipelines-openid-connect/

The following resources will be created:
 
 - IAM Role
 - IAM Identity Provider Web Identity

<!--- BEGIN_TF_DOCS --->

## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| audience | Enter the Identity Provider Audience as displayed in the Bitbucket OpenID Connect Provider page in your repository | `string` | n/a | yes |
| environment\_uuid | Enter the Environment UUID as displayed in the Bitbucket OpenID Connect Provider page in your repository. This is optional, will restrict this role to be used only with the Environment, if defined. | `string` | `""` | no |
| identity\_provider\_url | Enter the Identity Provider URL as displayed in the Bitbucket OpenID Connect Provider page in your repository | `string` | n/a | yes |
| oidc\_thumbprint | Thumbprint of OIDC host. See https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_providers_create_oidc_verify-thumbprint.html | `string` | `"a031c46782e6e6c662c2c87c76da9aa62ccabd8e"` | no |
| repository\_uuid | Enter the Repository UUID as displayed in the Bitbucket OpenID Connect Provider page in your repository | `string` | n/a | yes |
| role\_name | Name for the role to be created | `string` | n/a | yes |
| workspace\_uuid | Enter the Workspace UUID as displayed in the Bitbucket OpenID Connect Provider page in your repository | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| identity\_provider\_arn | n/a |
| role\_arn | n/a |

<!--- END_TF_DOCS --->

## Authors

Module managed by [DNX Solutions](https://github.com/DNXLabs).

## License

Apache 2 Licensed. See [LICENSE](https://github.com/DNXLabs/terraform-aws-bitbucket-oidc/blob/master/LICENSE) for full details.
