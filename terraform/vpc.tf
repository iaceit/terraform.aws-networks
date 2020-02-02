resource "aws_vpc" "main_vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = merge(
    {
      "Name" = "main_vpc"
    },
    var.tags,
  )
}

# Internet Gateway
resource "aws_internet_gateway" "main_igw" {
  vpc_id = aws_vpc.main_vpc.id

  tags = merge(
    {
      "Name" = "main_igw"
    },
    var.tags,
  )
}

# Subnets -- public and private
resource "aws_subnet" "main_public_subnet" {
  vpc_id                  = aws_vpc.main_vpc.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true

  tags = merge(
    {
      "Name" = "main_public_subnet"
    },
    var.tags,
  )
}

resource "aws_subnet" "main_private_subnet-a" {
  vpc_id                  = aws_vpc.main_vpc.id
  cidr_block              = "10.0.2.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "${var.region}a"

  tags = merge(
    {
      "Name" = "main_private_subnet-a"
    },
    var.tags,
  )
}

resource "aws_subnet" "main_private_subnet-b" {
  vpc_id                  = aws_vpc.main_vpc.id
  cidr_block              = "10.0.3.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "${var.region}b"

  tags = merge(
    {
      "Name" = "main_private_subnet-b"
    },
    var.tags,
  )
}

