resource "aws_launch_configuration" "data-launch-conf" {
  iam_instance_profile = "${aws_iam_instance_profile.master.id}"
  security_groups = ["${aws_security_group.data-allow_all.id}"]
  image_id = "${lookup(var.ubuntu_amis, var.aws_region)}"
  instance_type = "${var.data-instance-type}"
  key_name = "${aws_key_pair.druid.key_name}"
  user_data = "${template_file.data_user_data.rendered}"
  associate_public_ip_address = true

  lifecycle {
    create_before_destroy = false
  }
}

resource "template_file" "data_user_data" {
  template = "${file("${path.module}/data-user_data.sh")}"

  vars {
    masterIp = "${aws_instance.master.private_ip}"
  }
}