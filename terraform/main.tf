provider "aws" {
  region = "${var.aws_region}"
}

resource "aws_key_pair" "cluster_key" {
  key_name = "${var.cluster_name}-key"
  public_key = "${file("${var.aws_key_path}")}"
}

data "aws_caller_identity" "current" {}
