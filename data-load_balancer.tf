resource "aws_elb" "data-load_balancer" {
  name = "public-data-load-balancer"

  subnets = ["${aws_subnet.vpc.id}"]

  security_groups = ["${aws_security_group.data-allow_all.id}"]
  health_check {
    healthy_threshold = 2
    unhealthy_threshold = 2
    timeout = 5
    target = "HTTP:8200/"
    interval = 30
  }

  listener {
    instance_port = 8200
    instance_protocol = "http"
    lb_port = 8200
    lb_protocol = "http"
  }

}
