# Main Configuraion for region and profile
aws_profile         = "terraform"
aws_region          = "ca-central-1"
north_pole_vpc_cidr = "30.0.0.0/16"

#Subnet variables
cidrs_north_pole = {
  public1  = "30.0.1.0/24"
  public2  = "30.0.2.0/24"
  private1 = "30.0.3.0/24"
  private2 = "30.0.4.0/24"
  rds1     = "30.0.5.0/24"
  rds2     = "30.0.6.0/24"
  rds3     = "30.0.7.0/27"
}

#AZ variables
canada_az = {
  0 = "ca-central-1a"
  1 = "ca-central-1b"
}