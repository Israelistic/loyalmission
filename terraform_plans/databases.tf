######################RDS Instances####################
resource "aws_db_instance" "north_pole_wp_db" {
  allocated_storage      = 10
  engine                 = "mysql"
  engine_version         = "5.6.34"
  instance_class         = "${var.db_instance_class}"
  name                   = "${var.dbname}"
  username               = "${var.dbuser}"
  password               = "${var.dbpassword}"
  db_subnet_group_name   = "${aws_db_subnet_group.north_pole_rds_subnet_grp.name}"
  vpc_security_group_ids = ["${aws_security_group.north_pole_RDS_sg.id}"]
  skip_final_snapshot    = true #will help to destroy resource when needed
}