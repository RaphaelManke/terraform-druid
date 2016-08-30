resource "aws_elb" "query-load_balancer" {
  name = "public-query-load-balancer"

  subnets = ["${aws_subnet.vpc.id}"]

  security_groups = ["${aws_security_group.query-allow_all.id}"]
  health_check {
    healthy_threshold = 2
    unhealthy_threshold = 2
    timeout = 5
    target = "HTTP:8082/"
    interval = 30
  }

  listener {
    instance_port = 8082
    instance_protocol = "http"
    lb_port = 8082
    lb_protocol = "http"
  }
  listener {
    instance_port = 9095
    instance_protocol = "http"
    lb_port = 9095
    lb_protocol = "http"
  }

}
