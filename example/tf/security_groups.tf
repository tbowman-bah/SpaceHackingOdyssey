resource "aws_security_group" "operator_sg" {
  vpc_id = aws_vpc.space_vehicle_vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 3389
    to_port     = 3389
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = -1
    to_port     = -1
    protocol    = "-1"
    cidr_blocks = ["10.10.10.10/32", "10.10.20.10/32"]
  }

  tags = {
    Name = "OperatorSecurityGroup"
  }
}

resource "aws_security_group" "ground_station_sg" {
  vpc_id = aws_vpc.space_vehicle_vpc.id

  ingress {
    from_port   = -1
    to_port     = -1
    protocol    = "-1"
    cidr_blocks = ["10.10.20.20/32", "10.10.10.10/32"]
  }

  egress {
    from_port   = -1
    to_port     = -1
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "GroundStationSecurityGroup"
  }
}

resource "aws_security_group" "satellite_sg" {
  vpc_id = aws_vpc.space_vehicle_vpc.id

  ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "udp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = -1
    to_port     = -1
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "SatelliteSecurityGroup"
  }
}
