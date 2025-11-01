resource "aws_security_group" "test_alltraffic_sg" {
  vpc_id = aws_vpc.agevegacom_vpc.id
  name   = "${var.resource_prefix}-test-alltraffic-sg"

  description = "Grupo de seguridad que permite todo el trafico de entrada y salida para pruebas"

  # Reglas de entrada (inbound)
  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1" # -1 significa todos los protocolos
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Reglas de salida (outbound)
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1" # -1 significa todos los protocolos
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name  = "${var.resource_prefix}-test-alltraffic-sg"
    Usage = "test-default"
  }
}
