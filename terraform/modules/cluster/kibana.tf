resource "aws_instance" "es_kibana" {
    count = 1
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

    tags {
        Name        = "${var.cluster_name}-elasticsearch-kibana"
        Workload    = "elk_servers"
        Role        = "kibana"
    }
}

resource "aws_lb_target_group_attachment" "kibana" {
    count = "${aws_instance.es_kibana.count}"
    target_group_arn = "${aws_alb_target_group.kibana_target_group.arn}"
    target_id        = "${element(split(",", join(",", aws_instance.es_kibana.*.id)), count.index)}"
    port             = 5601
}