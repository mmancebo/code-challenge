##################################################################################
# RESOURCES
##################################################################################

# NETWORKING #
resource "aws_vpc" "vpc" {
  cidr_block = var.cidr

  tags = merge(local.common_tags, { Name = "${var.name}-vpc" })
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id

  tags = merge(local.common_tags, { Name = "${var.name}-igw" })

}

resource "aws_subnet" "public" {
  cidr_block              = var.public_subnets
  vpc_id                  = aws_vpc.vpc.id
  map_public_ip_on_launch = "true"
  availability_zone       = data.aws_availability_zones.available.names[0]

  tags = merge(local.common_tags, { Name = "${var.name}-subnet-public" })

}

resource "aws_subnet" "private" {
  cidr_block              = var.private_subnets
  vpc_id                  = aws_vpc.vpc.id
  map_public_ip_on_launch = "true"
  availability_zone       = data.aws_availability_zones.available.names[1]

  tags = merge(local.common_tags, { Name = "${var.name}-subnet-private" })

}

# ROUTING #
resource "aws_route_table" "rt-internet" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = merge(local.common_tags, { Name = "${var.name}-rt-internet" })

}

resource "aws_route_table_association" "route-association" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.rt-internet.id
}