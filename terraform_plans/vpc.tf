resource "aws_vpc" "north_pole_vpc" {
  cidr_block           = "${var.north_pole_vpc_cidr}"
  enable_dns_support   = true #A boolean flag to enable/disable DNS support in the VPC. Defaults true.
  enable_dns_hostnames = true #A boolean flag to enable/disable DNS hostnames in the VPC. Defaults false.
  tags = {
    Name = "north_pole"
  }
}