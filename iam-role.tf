resource "aws_iam_role" "default" {
  for_each           = { for role in var.roles : role.name => role }
  name               = each.value.name
  assume_role_policy = data.aws_iam_policy_document.assume_role_saml[each.key].json
}

data "aws_iam_policy_document" "assume_role_saml" {
  for_each = { for role in var.roles : role.name => role }

  statement {
    principals {
      type = "Federated"
      identifiers = [
        "arn:aws:iam::${data.aws_caller_identity.current.account_id}:oidc-provider/${replace(var.identity_provider_url, "https://", "")}"
      ]
    }
    actions = ["sts:AssumeRoleWithWebIdentity"]
    condition {
      test     = "ForAnyValue:StringLike"
      variable = "${replace(var.identity_provider_url, "https://", "")}:sub"
      values   = each.value.conditions
    }

    condition {
      test     = "IpAddress"
      variable = "aws:SourceIp"
      values = [
        "34.199.54.113/32",
        "34.232.25.90/32",
        "34.232.119.183/32",
        "34.236.25.177/32",
        "35.171.175.212/32",
        "52.54.90.98/32",
        "52.202.195.162/32",
        "52.203.14.55/32",
        "52.204.96.37/32",
        "34.218.156.209/32",
        "34.218.168.212/32",
        "52.41.219.63/32",
        "35.155.178.254/32",
        "35.160.177.10/32",
        "34.216.18.129/32"
      ]
    }
  }
}

locals {
  oidc_server_name = lookup(regex("^(?:(?P<scheme>[^:/?#]+):)?(?://(?P<host>[^/?#]*))?", var.identity_provider_url), "host")
}

# data "external" "thumbprint" {
#   program = list(<<EOT
#   echo {"thumbprint": "$(echo | openssl s_client -servername ${local.oidc_server_name} -showcerts -connect ${local.oidc_server_name}:443 2>&- | tail -r | sed -n '/-----END CERTIFICATE-----/,/-----BEGIN CERTIFICATE-----/p; /-----BEGIN CERTIFICATE-----/q' | tail -r | openssl x509 -fingerprint -noout | sed 's/://g' | awk -F= '{print tolower($2)}')"}
#   EOT
#   )
# }

resource "aws_iam_openid_connect_provider" "default" {
  url = var.identity_provider_url

  client_id_list = [
    var.audience,
  ]

  thumbprint_list = [
    var.oidc_thumbprint
  ]
}