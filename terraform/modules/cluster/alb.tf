resource "aws_alb" "es_alb" {

    name            = "${var.cluster_name}-es-alb"

    subnets = [
        "${var.public_subnet_1a}",
        "${var.public_subnet_1b}"
    ]

    security_groups = ["${aws_security_group.alb_sg.id}"]

    idle_timeout    = 600

    tags {
        Name            = "${var.cluster_name}-alb"
    }

}

resource "aws_alb_target_group" "elasticsearch_target_group" {

    name        = "${var.cluster_name}-es-trg"
    port        = "9200"
    protocol    = "HTTP"
    vpc_id      = "${var.vpc_id}"

    target_type = "instance"

    lifecycle { create_before_destroy = true }

    health_check {
        healthy_threshold   = 3
        unhealthy_threshold = 10
        timeout             = 5
        interval            = 30
        matcher             = "200"
        path                = "/"
        port                = "9200"
    }

    depends_on = ["aws_alb.es_alb"]

}

resource "aws_alb_target_group" "kibana_target_group" {

    name        = "${var.cluster_name}-kibana-trg"
    port        = "5601"
    protocol    = "HTTP"
    vpc_id      = "${var.vpc_id}"
    target_type = "instance"

    lifecycle { create_before_destroy = true }

    health_check {
        healthy_threshold   = 3
        unhealthy_threshold = 10
        timeout             = 5
        interval            = 30
        matcher             = "200"
        path                = "/"
        port                = "9200"
    }

    depends_on = ["aws_alb.es_alb"]

}