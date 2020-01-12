# Main Configuraion for region and profile
variable "aws_region" {}

variable "aws_profile" {}

data "aws_availability_zones" "available" {
  state = "available"
}

variable "north_pole_vpc_cidr" {}
