output "app_public_ip" {
  value = aws_eip.app.public_ip
}

output "app_security_group_id" {
  value = aws_security_group.app.id
}
