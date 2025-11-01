resource "aws_security_group" "matrix_fullaccess_sg" {
  vpc_id = aws_vpc.matrix_vpc.id
  name   = "${var.resource_prefix}-alltraffic-sg"

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
    Name = "${var.resource_prefix}-sg"
  }
}
