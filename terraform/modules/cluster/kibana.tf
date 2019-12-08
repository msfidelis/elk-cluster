resource "aws_instance" "es_kibana" {

    ami             = "ami-0a313d6098716f372"
    instance_type   = "${var.kibana_instance_type}"
    subnet_id       = "${var.public_subnet_1a}"

    associate_public_ip_address = true

    vpc_security_group_ids = ["${aws_security_group.cluster_sg.id}"]

    key_name = "${var.cluster_key}"

    root_block_device {
        volume_size = "60"
        volume_type = "standard"
    }

    tags = {
        Name        = "${var.cluster_name}-elasticsearch-kibana"
        Workload    = "elk_servers"
        Role        = "kibana"
    }
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
        port                = 5601
    }

    depends_on = ["aws_alb.es_alb"]

}

resource "aws_lb_target_group_attachment" "kibana" {
    target_group_arn = aws_alb_target_group.kibana_target_group.arn
    target_id        = aws_instance.es_kibana.id
    port             = 5601
}