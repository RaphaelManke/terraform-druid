resource "aws_security_group" "master-allow_all" {
  name = "master-allow_all"
  description = "Allow all inbound traffic"
  vpc_id = "${aws_vpc.druid.id}"
  ingress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags {
    Name = "master-allow_all"
  }
}