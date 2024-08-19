resource "aws_vpc" "space_vehicle_vpc" {
  cidr_block           = "10.10.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "SpaceVehicleVPC"
  }
}

resource "aws_internet_gateway" "space_vehicle_igw" {
  vpc_id = aws_vpc.space_vehicle_vpc.id

  tags = {
    Name = "SpaceVehicleIGW"
  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.space_vehicle_vpc.id
  cidr_block              = "10.10.20.0/24"
  map_public_ip_on_launch = true
  availability_zone       = data.aws_availability_zones.available.names[0]
}

resource "aws_subnet" "private_subnet" {
  vpc_id            = aws_vpc.space_vehicle_vpc.id
  cidr_block        = "10.10.10.0/24"
  availability_zone = data.aws_availability_zones.available.names[0]
}

resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.space_vehicle_vpc.id

  tags = {
    Name = "PublicRouteTable"
  }
}

resource "aws_route" "public_route" {
  route_table_id         = aws_route_table.public_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.space_vehicle_igw.id
}
