resource "aws_instance" "es_master" {

    ami             = "ami-0a313d6098716f372"
    instance_type   = "${var.nodes_instance_type}"

    subnet_id       = "${var.public_subnet_1a}"

    associate_public_ip_address = true

    vpc_security_group_ids = ["${aws_security_group.cluster_sg.id}"]

    key_name = "${var.cluster_key}"

    root_block_device {
        volume_size = "60"
        volume_type = "standard"
    }

    tags = {
        Name        = "${var.cluster_name}-elasticsearch-master"
        Workload    = "elk_servers"
        Role        = "elasticsearch_master"
    }
}

resource "aws_lb_target_group_attachment" "master" {
    target_group_arn = aws_alb_target_group.elasticsearch_target_group.arn
    target_id        = aws_instance.es_master.id
    port             = 9200
}