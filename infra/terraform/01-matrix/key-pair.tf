resource "tls_private_key" "ec2_key_pair" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "matrix_key_pair" {
  key_name   = replace("${var.resource_prefix}-keypair", ".", "-")
  public_key = tls_private_key.ec2_key_pair.public_key_openssh

  tags = {
    Name = "${var.resource_prefix}-keypair"
  }
}

output "private_key" {
  description = "Private key to use for SSH access"
  value       = tls_private_key.ec2_key_pair.private_key_pem
  sensitive   = true
}
