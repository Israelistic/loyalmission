# Main Configuraion for region and profile
variable "aws_region" {}

variable "aws_profile" {}

data "aws_availability_zones" "available" {
  state = "available"
}
variable "north_pole_vpc_cidr" {}
variable "cidrs_north_pole" {
  type = "map"
}
variable "canada_az" {
  type = "map"
}
