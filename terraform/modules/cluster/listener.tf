resource "aws_alb_listener" "elasticsearch" {
  load_balancer_arn = "${aws_alb.es_alb.arn}"
  port              = 9200
  protocol          = "HTTP"
  depends_on        = ["aws_alb_target_group.elasticsearch_target_group"]

  default_action {
    target_group_arn = "${aws_alb_target_group.elasticsearch_target_group.arn}"
    type             = "forward"
  }
}

resource "aws_alb_listener" "kibana" {
  load_balancer_arn = "${aws_alb.es_alb.arn}"
  port              = 5601
  protocol          = "HTTP"
  depends_on        = ["aws_alb_target_group.kibana_target_group"]

  default_action {
    target_group_arn = "${aws_alb_target_group.kibana_target_group.arn}"
    type             = "forward"
  }
}

resource "aws_alb_listener" "apm" {
  load_balancer_arn = "${aws_alb.es_alb.arn}"
  port              = 8200
  protocol          = "HTTP"
  depends_on        = ["aws_alb_target_group.apm_target_group"]

  default_action {
    target_group_arn = "${aws_alb_target_group.apm_target_group.arn}"
    type             = "forward"
  }
}

resource "aws_alb_listener" "logstash" {
  load_balancer_arn = "${aws_alb.es_alb.arn}"
  port              = 5044
  protocol          = "HTTP"
  depends_on        = ["aws_alb_target_group.logstash_target_group"]

  default_action {
    target_group_arn = "${aws_alb_target_group.logstash_target_group.arn}"
    type             = "forward"
  }
}