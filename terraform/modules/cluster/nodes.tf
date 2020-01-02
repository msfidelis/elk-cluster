resource "aws_instance" "es_nodes_a" {

    ami = var.aws_ami_base
    instance_type = "${var.nodes_instance_type}"

    subnet_id = "${var.public_subnet_1a}"
    associate_public_ip_address = true
    vpc_security_group_ids = ["${aws_security_group.cluster_sg.id}"]

    key_name = "${var.cluster_key}"

    root_block_device {
        volume_size = "60"
        volume_type = "standard"
    }

    tags = {
        Name        = "${var.cluster_name}-elasticsearch-node"
        Workload    = "elk_servers"
        Role        = "elasticsearch_node"
    }
}

resource "aws_instance" "es_nodes_b" {
    ami = "ami-0a313d6098716f372"
    instance_type = var.nodes_instance_type

    subnet_id = var.public_subnet_1b

    associate_public_ip_address = true

    vpc_security_group_ids = [ aws_security_group.cluster_sg.id ]

    key_name = var.cluster_key

    root_block_device {
        volume_size = "60"
        volume_type = "standard"
    }

    tags = {
        Name        = "${var.cluster_name}-elasticsearch-node"
        Workload    = "elk_servers"
        Role        = "elasticsearch_node"
    }
}

resource "aws_alb_target_group" "elasticsearch_target_group" {

    name        = "${var.cluster_name}-es-trg"
    port        = "9200"
    protocol    = "HTTP"
    vpc_id      = var.vpc_id

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

    depends_on = [ "aws_alb.es_alb" ]

}

resource "aws_lb_target_group_attachment" "nodes_a" {
    target_group_arn = aws_alb_target_group.elasticsearch_target_group.arn
    target_id        = aws_instance.es_nodes_a.id
    port             = 9200
}

resource "aws_lb_target_group_attachment" "nodes_b" {
    target_group_arn = aws_alb_target_group.elasticsearch_target_group.arn
    target_id        = aws_instance.es_nodes_b.id
    port             = 9200
}