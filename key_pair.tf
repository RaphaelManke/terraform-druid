resource "aws_key_pair" "druid" {
  key_name = "druid-main-key"
  public_key = "${var.ssh_public_key}"
}
