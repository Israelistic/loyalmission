resource "aws_key_pair" "bear_auth" {
  key_name   = "${var.key_name}"
  public_key = "${file(var.bear_public_key_path)}"
}
