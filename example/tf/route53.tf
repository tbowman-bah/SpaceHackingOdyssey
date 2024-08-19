resource "aws_route53_zone" "space_vehicle_zone" {
  name = "spacevehicle.space"
  vpc {
    vpc_id     = aws_vpc.space_vehicle_vpc.id
    vpc_region = var.region
  }

  comment = "Private hosted zone for spacevehicle.space"
}

resource "aws_route53_zone" "ground_station_zone" {
  name = "groundstation.earth"
  vpc {
    vpc_id     = aws_vpc.space_vehicle_vpc.id
    vpc_region = var.region
  }

  comment = "Private hosted zone for groundstation.earth"
}

resource "aws_route53_record" "operator_station_record" {
  zone_id = aws_route53_zone.ground_station_zone.zone_id
  name    = "operator.groundstation.earth"
  type    = "A"
  ttl     = "60"
  records = [aws_instance.operator_station.private_ip]
}

resource "aws_route53_record" "ground_station_record" {
  zone_id = aws_route53_zone.ground_station_zone.zone_id
  name    = "cosmos.groundstation.earth"
  type    = "A"
  ttl     = "60"
  records = [aws_instance.ground_station.private_ip]
}

resource "aws_route53_record" "satellite_record" {
  zone_id = aws_route53_zone.space_vehicle_zone.zone_id
  name    = "moonlighter.spacevehicle.space"
  type    = "A"
  ttl     = "60"
  records = [aws_instance.satellite.private_ip]
}
