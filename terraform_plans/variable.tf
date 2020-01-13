# Main Configuraion for region and profile
variable "aws_region" {}
variable "aws_profile" {}
variable "local_ip" {}

data "aws_availability_zones" "available" {
  state = "available"
}

#VPC VAR
variable "north_pole_vpc_cidr" {}

#SUBNET VAR
variable "cidrs_north_pole" {
  type = "map"
}
variable "canada_az" {
  type = "map"
}

#DNS VAR
variable "domain_name" {}

