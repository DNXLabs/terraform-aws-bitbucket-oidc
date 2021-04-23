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
| audience | n/a | `string` | n/a | yes |
| environment\_uuid | n/a | `string` | `""` | no |
| identity\_provider\_url | n/a | `string` | n/a | yes |
| name | n/a | `string` | n/a | yes |
| oidc\_thumbprint | Thumbprint of OIDC host. See https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_providers_create_oidc_verify-thumbprint.html | `string` | `"a031c46782e6e6c662c2c87c76da9aa62ccabd8e"` | no |
| repository\_uuid | n/a | `string` | n/a | yes |
| workspace\_uuid | n/a | `string` | n/a | yes |

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
