resource "aws_route_table_association" "public" {
  subnet_id = "${aws_subnet.vpc.id}"
  route_table_id = "${aws_route_table.vpc-subnet_route_table.id}"
}
