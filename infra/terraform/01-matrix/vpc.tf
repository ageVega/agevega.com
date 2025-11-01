resource "aws_vpc" "matrix_vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "Matrix VPC"
  }
}

# Crear 3 subredes públicas en diferentes AZs
resource "aws_subnet" "public_subnet_1" {
  vpc_id            = aws_vpc.matrix_vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "eu-west-1a"
  
  tags = {
    Name = "Public Subnet 1"
  }
}

resource "aws_subnet" "public_subnet_2" {
  vpc_id            = aws_vpc.matrix_vpc.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "eu-west-1b"
  
  tags = {
    Name = "Public Subnet 2"
  }
}

resource "aws_subnet" "public_subnet_3" {
  vpc_id            = aws_vpc.matrix_vpc.id
  cidr_block        = "10.0.3.0/24"
  availability_zone = "eu-west-1c"
  
  tags = {
    Name = "Public Subnet 3"
  }
}

# Crear 3 subredes privadas en diferentes AZs
resource "aws_subnet" "private_subnet_1" {
  vpc_id            = aws_vpc.matrix_vpc.id
  cidr_block        = "10.0.4.0/24"
  availability_zone = "eu-west-1a"
  
  tags = {
    Name = "Private Subnet 1"
  }
}

resource "aws_subnet" "private_subnet_2" {
  vpc_id            = aws_vpc.matrix_vpc.id
  cidr_block        = "10.0.5.0/24"
  availability_zone = "eu-west-1b"
  
  tags = {
    Name = "Private Subnet 2"
  }
}

resource "aws_subnet" "private_subnet_3" {
  vpc_id            = aws_vpc.matrix_vpc.id
  cidr_block        = "10.0.6.0/24"
  availability_zone = "eu-west-1c"
  
  tags = {
    Name = "Private Subnet 3"
  }
}

# Crear un Internet Gateway para las subredes públicas
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.matrix_vpc.id

  tags = {
    Name = "Matrix Internet Gateway"
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
    Name = "Matrix VPC Endpoint S3"
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
    Name = "Public Route Table"
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
    Name = "Private Route Table 1"
  }
}

resource "aws_route_table" "private_route_table_2" {
  vpc_id = aws_vpc.matrix_vpc.id

  tags = {
    Name = "Private Route Table 2"
  }
}

resource "aws_route_table" "private_route_table_3" {
  vpc_id = aws_vpc.matrix_vpc.id

  tags = {
    Name = "Private Route Table 3"
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
