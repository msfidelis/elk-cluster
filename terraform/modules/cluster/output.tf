output "alb_dns" {
  value = "${aws_alb.es_alb.dns_name}"
}