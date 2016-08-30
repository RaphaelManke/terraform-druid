resource "aws_autoscaling_group" "query-autoscaling-group" {
  name = "query-autoscaling-group"
  min_size = "${var.query-instance-count}"
  max_size = "${var.query-instance-count}"
  desired_capacity = "${var.query-instance-count}"

  availability_zones = ["${aws_subnet.vpc.availability_zone}"]
  vpc_zone_identifier = ["${aws_subnet.vpc.id}"]
  load_balancers = ["${aws_elb.query-load_balancer.id}"]
  launch_configuration = "${aws_launch_configuration.query-launch-conf.id}"
}