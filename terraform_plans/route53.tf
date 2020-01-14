# Primary Zone north pole
resource "aws_route53_zone" "north_pole_primary" {
  name              = "${var.domain_name}.ca"
  delegation_set_id = "${var.delegation_set}"
}

# north pole WWW
resource "aws_route53_record" "north_pole_www" {
  zone_id  = "${aws_route53_zone.north_pole_primary.zone_id}"
  name     = "www.${var.domain_name}.ca"
  type     = "A"

  alias { # the alias is point to the load blancer. every time elb changes his ip the alias will help it to follow the address
    name                   = "${aws_elb.north_pole_wp_elb.dns_name}"
    zone_id                = "${aws_elb.north_pole_wp_elb.zone_id}"
    evaluate_target_health = false
  }
}
#  north pole Dev
resource "aws_route53_record" "noth_pole_record_dev" {
  zone_id  = "${aws_route53_zone.north_pole_primary.zone_id}"
  name     = "dev.${var.domain_name}.ca"
  type     = "A"
  ttl      = "300"
  records  = ["${aws_instance.north_pole_bear_wp_dev.public_ip}"]
}
#  north pole Private Zone

resource "aws_route53_zone" "north_pole_secondary_record" {
  name     = "${var.domain_name}.ca"
  vpc {
    vpc_id = "${aws_vpc.north_pole_vpc.id}"
  }

}

# north pole DB

resource "aws_route53_record" "north_pole_db_record" {
  zone_id  = "${aws_route53_zone.north_pole_secondary_record.zone_id}"
  name     = "db.${var.domain_name}.ca"
  type     = "CNAME"
  ttl      = "300"
  records  = ["${aws_db_instance.north_pole_wp_db.address}"]
}

