# private Subnet on us-east-1a
resource "aws_subnet" "private_subnet_cluster_1a" {
  vpc_id                  = "${aws_vpc.cluster_vpc.id}"
  cidr_block              = "12.0.32.0/20"
  availability_zone       = "us-east-1a"

  tags = {
    Name = "${var.cluster_name}-private-subnet-1a"
  }
}

# private Subnet on us-east-1b
resource "aws_subnet" "private_subnet_cluster_1b" {
  vpc_id                  = "${aws_vpc.cluster_vpc.id}"
  cidr_block              = "12.0.48.0/20"
  availability_zone       = "us-east-1b"

  tags = {
     Name = "${var.cluster_name}-private-subnet-1b"
  }
}