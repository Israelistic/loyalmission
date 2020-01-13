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
#DB VARS
variable "db_instance_class" {}
variable "dbname" {}
variable "dbuser" {}
variable "dbpassword" {}
#EC2 vars
variable "dev_instance_type" {}
variable "dev_ami_north_pole" {}
variable "bear_public_key_path" {}
# Key Pair
variable "key_name" {}
#ELB
variable elb_healthy_threshold {}
variable elb_unhealthy_threshold {}
variable elb_timeout {}
variable elb_interval {}
# AUTOSCALING
variable "asg_max" {}
variable "asg_min" {}
variable "asg_grace" {}
variable "asg_hct" {}
variable "asg_cap" {}
# Lunch Configuration
variable "lc_instance_type" {}
