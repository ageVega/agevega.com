resource "aws_vpc" "matrix_vpc" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = "${var.resource_prefix}-vpc"
  }
}

# Crear 3 subredes públicas en diferentes AZs
resource "aws_subnet" "public_subnet_1" {
  vpc_id            = aws_vpc.matrix_vpc.id
  cidr_block        = var.public_subnets[0]
  availability_zone = var.availability_zones[0]

  tags = {
    Name = "${var.resource_prefix}-subnet-public1-${var.availability_zones[0]}"
  }
}

resource "aws_subnet" "public_subnet_2" {
  vpc_id            = aws_vpc.matrix_vpc.id
  cidr_block        = var.public_subnets[1]
  availability_zone = var.availability_zones[1]

  tags = {
    Name = "${var.resource_prefix}-subnet-public2-${var.availability_zones[1]}"
  }
}

resource "aws_subnet" "public_subnet_3" {
  vpc_id            = aws_vpc.matrix_vpc.id
  cidr_block        = var.public_subnets[2]
  availability_zone = var.availability_zones[2]

  tags = {
    Name = "${var.resource_prefix}-subnet-public3-${var.availability_zones[2]}"
  }
}

# Crear 3 subredes privadas en diferentes AZs
resource "aws_subnet" "private_subnet_1" {
  vpc_id            = aws_vpc.matrix_vpc.id
  cidr_block        = var.private_subnets[0]
  availability_zone = var.availability_zones[0]

  tags = {
    Name = "${var.resource_prefix}-subnet-private1-${var.availability_zones[0]}"
  }
}

resource "aws_subnet" "private_subnet_2" {
  vpc_id            = aws_vpc.matrix_vpc.id
  cidr_block        = var.private_subnets[1]
  availability_zone = var.availability_zones[1]

  tags = {
    Name = "${var.resource_prefix}-subnet-private2-${var.availability_zones[1]}"
  }
}

resource "aws_subnet" "private_subnet_3" {
  vpc_id            = aws_vpc.matrix_vpc.id
  cidr_block        = var.private_subnets[2]
  availability_zone = var.availability_zones[2]

  tags = {
    Name = "${var.resource_prefix}-subnet-private3-${var.availability_zones[2]}"
  }
}

# Crear un Internet Gateway para las subredes públicas
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.matrix_vpc.id

  tags = {
    Name = "${var.resource_prefix}-igw"
  }
}
resource "aws_vpc_endpoint" "vpce_s3" {
  vpc_id       = aws_vpc.matrix_vpc.id
  service_name = "com.amazonaws.${var.aws_region}.s3"
  route_table_ids = [
    aws_route_table.private_route_table_1.id,
    aws_route_table.private_route_table_2.id,
    aws_route_table.private_route_table_3.id,
  ]

  tags = {
    Name = "${var.resource_prefix}-vpce-s3"
  }
}

# Crear una tabla de enrutamiento para las subredes públicas
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.matrix_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "${var.resource_prefix}-rtb-public"
  }
}

# Asociar las subredes públicas a la tabla de enrutamiento pública
resource "aws_route_table_association" "public_subnet_1_association" {
  subnet_id      = aws_subnet.public_subnet_1.id
  route_table_id = aws_route_table.public_route_table.id
}

resource "aws_route_table_association" "public_subnet_2_association" {
  subnet_id      = aws_subnet.public_subnet_2.id
  route_table_id = aws_route_table.public_route_table.id
}

resource "aws_route_table_association" "public_subnet_3_association" {
  subnet_id      = aws_subnet.public_subnet_3.id
  route_table_id = aws_route_table.public_route_table.id
}

# Crear una tabla de enrutamiento para cada subred privada
resource "aws_route_table" "private_route_table_1" {
  vpc_id = aws_vpc.matrix_vpc.id

  tags = {
    Name = "${var.resource_prefix}-rtb-private1-${var.availability_zones[0]}"
  }
}

resource "aws_route_table" "private_route_table_2" {
  vpc_id = aws_vpc.matrix_vpc.id

  tags = {
    Name = "${var.resource_prefix}-rtb-private2-${var.availability_zones[1]}"
  }
}

resource "aws_route_table" "private_route_table_3" {
  vpc_id = aws_vpc.matrix_vpc.id

  tags = {
    Name = "${var.resource_prefix}-rtb-private3-${var.availability_zones[2]}"
  }
}

# Asociar las subredes privadas a sus respectivas tablas de enrutamiento

resource "aws_route_table_association" "private_subnet_1_association" {
  subnet_id      = aws_subnet.private_subnet_1.id
  route_table_id = aws_route_table.private_route_table_1.id
}

resource "aws_route_table_association" "private_subnet_2_association" {
  subnet_id      = aws_subnet.private_subnet_2.id
  route_table_id = aws_route_table.private_route_table_2.id
}

resource "aws_route_table_association" "private_subnet_3_association" {
  subnet_id      = aws_subnet.private_subnet_3.id
  route_table_id = aws_route_table.private_route_table_3.id
}
