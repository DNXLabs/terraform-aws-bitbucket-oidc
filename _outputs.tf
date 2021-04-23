output "role_arn" {
  value = aws_iam_role.default.arn
}

output "identity_provider_arn" {
  value = aws_iam_openid_connect_provider.default.arn
}