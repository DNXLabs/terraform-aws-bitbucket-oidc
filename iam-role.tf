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