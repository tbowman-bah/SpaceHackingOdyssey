resource "aws_instance" "operator_station" {
  ami                         = "ami-0b4eeeedb09746c68" # Replace with the actual AMI ID
  instance_type               = "c5.xlarge"
  subnet_id                   = aws_subnet.public_subnet.id
  security_groups             = [aws_security_group.operator_sg.name]
  key_name                    = "bhus24" # Replace with your key name
  private_ip                  = "10.10.20.20"
  associate_public_ip_address = true

  tags = {
    Name = "OperatorStation"
  }
}

resource "aws_eip" "operator_eip" {
  instance = aws_instance.operator_station.id
}

resource "aws_instance" "ground_station" {
  ami             = "ami-021d420338c6803d5" # Replace with the actual AMI ID
  instance_type   = "t2.xlarge"
  subnet_id       = aws_subnet.public_subnet.id
  security_groups = [aws_security_group.ground_station_sg.name]
  key_name        = "bhus24" # Replace with your key name
  private_ip      = "10.10.20.10"

  tags = {
    Name = "GroundStation"
  }
}

resource "aws_instance" "satellite" {
  ami             = "ami-0d1b30640d4c80725" # Replace with the actual AMI ID
  instance_type   = "c5.xlarge"
  subnet_id       = aws_subnet.private_subnet.id
  security_groups = [aws_security_group.satellite_sg.name]
  key_name        = "bhus24" # Replace with your key name
  private_ip      = "10.10.10.10"

  tags = {
    Name = "Satellite"
  }
}
