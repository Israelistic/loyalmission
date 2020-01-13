# -----S3 code bucket ---------

# Create a rendom 6 digit to our S3 bucket to make it unique
resource "random_id" "north_pole_wp_code_bucket" {
  byte_length = 2
}

resource "aws_s3_bucket" "north_pole_code" {
  bucket        = "${var.domain_name}-${random_id.north_pole_wp_code_bucket.dec}"
  acl           = "private" # make th bucket private
  force_destroy = true      # will make sure the s3 will be destroy
  tags = {
    Name = "north_pole_code_bucket"
  }
}