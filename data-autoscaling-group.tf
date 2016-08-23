resource "aws_autoscaling_group" "data-autoscaling-group" {
  name = "data-autoscaling-group"
  min_size = "${var.data-instance-count}"
  max_size = "${var.data-instance-count}"
  desired_capacity = "${var.data-instance-count}"

  availability_zones = ["${aws_subnet.vpc.availability_zone}"]
  vpc_zone_identifier = ["${aws_subnet.vpc.id}"]
  load_balancers = ["${aws_elb.data-load_balancer.id}"]
  launch_configuration = "${aws_launch_configuration.data-launch-conf.id}"
}