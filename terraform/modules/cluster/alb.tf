resource "aws_alb" "es_alb" {

    name            = "${var.cluster_name}-es-alb"

    subnets = [
        "${var.public_subnet_1a}",
        "${var.public_subnet_1b}"
    ]

    security_groups = ["${aws_security_group.alb_sg.id}"]

    idle_timeout    = 600

    tags = {
        Name            = "${var.cluster_name}-alb"
    }

}