# VPC Endpoint for S3
resource "aws_vpc_endpoint" "north_pole_wp_private-s3_enpoint" {
  vpc_id          = "${aws_vpc.north_pole_vpc.id}"
  service_name    = "com.amazonaws.${var.aws_region}.s3"
  route_table_ids = ["${aws_default_route_table.north_pole_private_rt.id}", "${aws_route_table.north_pole_rt.id}"]
  policy          = <<POLICY
{
    "Statement": [
      {
        "Action": "*",
        "Effect": "Allow",
        "Resource": "*",
        "Principal": "*"
      }
    ]
}
POLICY
}
