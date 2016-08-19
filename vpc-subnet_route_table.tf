resource "aws_route_table" "vpc-subnet_route_table" {
  vpc_id = "${aws_vpc.druid.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.druid.id}"
  }

  tags {
    Network = "Public"
  }
}
