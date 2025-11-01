resource "tls_private_key" "lab_test_keypair" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "lab_test_keypair" {
  key_name   = replace("${var.resource_prefix}-test-keypair", ".", "-")
  public_key = tls_private_key.lab_test_keypair.public_key_openssh

  tags = {
    Name  = "${var.resource_prefix}-test-keypair"
    Usage = "lab-testing"
  }
}

output "private_key" {
  description = "Private key to use for SSH access (test keypair)"
  value       = tls_private_key.lab_test_keypair.private_key_pem
  sensitive   = true
}
