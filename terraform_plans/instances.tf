resource "aws_instance" "north_pole_bear_wp_dev" {
  instance_type = "${var.dev_instance_type}"
  ami           = "${var.dev_ami_north_pole}"
  associate_public_ip_address = true
  tags = {
    Name = "bear_wp_dev"
  }
  key_name               = "${aws_key_pair.bear_auth.id}"
  vpc_security_group_ids = ["${aws_security_group.north_pole_wp_dev_sg.id}"]
  iam_instance_profile   = "${aws_iam_instance_profile.s3_access_profile.id}"
  subnet_id              = "${aws_subnet.north_pole_public1_sunbet.id}"
  provisioner "local-exec" {
    command = <<EOD
cat <<EOF > aws_hosts
[dev]
${aws_instance.north_pole_bear_wp_dev.public_ip}
[dev:vars]
s3code=${aws_s3_bucket.north_pole_code.bucket}
domain=${var.domain_name}
EOF
EOD
  }
  provisioner "local-exec" {
    command = "aws ec2 wait instance-status-ok --instance-ids ${aws_instance.north_pole_bear_wp_dev.id} --profile terraform && ansible-playbook -i aws_hosts wordpress.yml"
  }
}