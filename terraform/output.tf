# Output ec2 info to ansible inventory
resource "local_sensitive_file" "private_key" {
  content           = tls_private_key.key.private_key_pem
  filename          = format("%s/%s", abspath(path.root), "../ansible/ssh-key.pem")
  file_permission   = "0600"
}
resource "local_file" "ansible_inventory" {
  content          = templatefile("inventory.tmpl", {
      ip1          = aws_instance.web1.public_ip,
      ip2          = aws_instance.web2.public_ip,
      rds_endpoint = aws_db_instance.project_db.address,
      ssh_keyfile = local_sensitive_file.private_key.filename
  })
  filename = "${path.module}./ansible/inventory.yaml"
}

resource "local_file" "env_file_database" {
  content          = templatefile(".env.example.tmpl", {
      rds_endpoint = aws_db_instance.project_db.address,
  })
  filename = "${path.module}./ansible/.env"
}