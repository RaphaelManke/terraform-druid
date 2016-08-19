resource "aws_s3_bucket" "s3-bucket" {
  bucket = "druid-data-cc-23"
  force_destroy = true

  lifecycle {
    prevent_destroy = false
  }
}
