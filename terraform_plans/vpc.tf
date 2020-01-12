resource "aws_vpc" "north_pole_vpc" {
  provider             = aws.central
  cidr_block           = "30.0.0.0/16"
  enable_dns_support   = true #A boolean flag to enable/disable DNS support in the VPC. Defaults true.
  enable_dns_hostnames = true #A boolean flag to enable/disable DNS hostnames in the VPC. Defaults false.
  tags = {
    Name = "north_pole"
  }
}