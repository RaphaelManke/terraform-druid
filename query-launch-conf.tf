resource "aws_launch_configuration" "query-launch-conf" {
  iam_instance_profile = "${aws_iam_instance_profile.master.id}"
  security_groups = ["${aws_security_group.query-allow_all.id}"]
  image_id = "${lookup(var.ubuntu_amis, var.aws_region)}"
  instance_type = "${var.query-instance-type}"
  key_name = "${aws_key_pair.druid.key_name}"
  user_data = "${template_file.query_user_data.rendered}"
  associate_public_ip_address = true

  lifecycle {
    create_before_destroy = false
  }
}

resource "template_file" "query_user_data" {
  template = "${file("${path.module}/query-user_data.sh")}"

  vars {
    masterIp = "${aws_instance.master.private_ip}"
  }
}