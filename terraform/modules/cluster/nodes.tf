resource "aws_instance" "es_nodes_a" {
    count = 1
    ami = "ami-0a313d6098716f372"
    instance_type = "${var.nodes_instance_type}"

    subnet_id = "${var.public_subnet_1a}"

    associate_public_ip_address = true

    vpc_security_group_ids = ["${aws_security_group.cluster_sg.id}"]

    key_name = "${var.cluster_key}"

    root_block_device {
        volume_size = "60"
        volume_type = "standard"
    }

    tags {
        Name        = "${var.cluster_name}-elasticsearch-node"
        Workload    = "elk_servers"
        Role        = "elasticsearch_node"
    }
}

resource "aws_lb_target_group_attachment" "nodes_a" {
    count = "${aws_instance.es_nodes_a.count}"
    target_group_arn = "${aws_alb_target_group.elasticsearch_target_group.arn}"
    target_id        = "${element(split(",", join(",", aws_instance.es_nodes_a.*.id)), count.index)}"
    port             = 9200
}

resource "aws_instance" "es_nodes_b" {
    count = 1
    ami = "ami-0a313d6098716f372"
    instance_type = "${var.nodes_instance_type}"

    subnet_id = "${var.public_subnet_1b}"

    associate_public_ip_address = true

    vpc_security_group_ids = ["${aws_security_group.cluster_sg.id}"]

    key_name = "${var.cluster_key}"

    root_block_device {
        volume_size = "60"
        volume_type = "standard"
    }

    tags {
        Name        = "${var.cluster_name}-elasticsearch-node"
        Workload    = "elk_servers"
        Role        = "elasticsearch_node"
    }
}

resource "aws_lb_target_group_attachment" "nodes_b" {
    count = "${aws_instance.es_nodes_b.count}"
    target_group_arn = "${aws_alb_target_group.elasticsearch_target_group.arn}"
    target_id        = "${element(split(",", join(",", aws_instance.es_nodes_b.*.id)), count.index)}"
    port             = 9200
}