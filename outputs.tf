output "DataLoadBalancer" {
  value = "${aws_elb.data-load_balancer.dns_name}"
}
output "MasterIp" {
  value = "${aws_instance.master.public_ip}"
}
output "QueryLoadBalancer" {
  value = "${aws_elb.query-load_balancer.dns_name}"
}
