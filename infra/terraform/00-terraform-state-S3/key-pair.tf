resource "aws_key_pair" "test_keypair" {
  key_name   = "${var.resource_prefix}-test-keypair"
  public_key = file(var.test_keypair_public_key)

  tags = merge(
    var.common_tags,
    {
      Name  = "${var.resource_prefix}-test-keypair"
      Usage = "test-default"
    },
  )
}
