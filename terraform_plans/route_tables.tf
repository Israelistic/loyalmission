#Creat a Route_Table(TR) && Grant the VPC internet access on its north pole route table
resource "aws_route_table" "north_pole_rt" {
  vpc_id = "${aws_vpc.north_pole_vpc.id}"
  tags = {
    Name = "north_pole_public_RT"
  }
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.north_pole_itg.id}"
  }
}
output "RT_north_pole_id" {
  value = "${aws_route_table.north_pole_rt.id}"
}
#create a default private route table
resource "aws_default_route_table" "north_pole_private_rt" {
  default_route_table_id = "${aws_vpc.north_pole_vpc.default_route_table_id}"
  tags = {
    Name = "north_pole_private_RT"
  }
}
