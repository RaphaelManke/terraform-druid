# Create a master
resource "aws_instance" "master" {
  iam_instance_profile = "${aws_iam_instance_profile.master.id}"
  ami = "${lookup(var.ubuntu_amis, var.aws_region)}"
  instance_type = "${var.master-instance-type}"
  associate_public_ip_address = "true"
  subnet_id = "${aws_subnet.vpc.id}"
  vpc_security_group_ids = ["${aws_security_group.master-allow_all.id}"]
  key_name = "${aws_key_pair.druid.key_name}"
  user_data = "${template_file.master_user_data.rendered}"
  tags {
    Name = "master-instance"
  }
}

resource "template_file" "master_user_data" {
  template = "${file("${path.module}/master-user_data.sh")}"

  vars {
  }
}