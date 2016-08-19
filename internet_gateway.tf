resource "aws_internet_gateway" "druid" {
  vpc_id = "${aws_vpc.druid.id}"

  tags {
    Network = "Public"
  }
}
