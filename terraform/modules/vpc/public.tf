#### Public Subnets

# Public Subnet on us-east-1a
resource "aws_subnet" "public_subnet_cluster_1a" {
  vpc_id                  = "${aws_vpc.cluster_vpc.id}"
  cidr_block              = "12.0.0.0/20"
  map_public_ip_on_launch = true
  availability_zone       = "${var.aws_region}a"

  tags =
  {
    Name = "${var.cluster_name}-public-subnet-1a"
    Tier = "public"
    Workload = "k8s"
  }
}

# Public Subnet on us-east-1b
resource "aws_subnet" "public_subnet_cluster_1b" {
  vpc_id                  = "${aws_vpc.cluster_vpc.id}"
  cidr_block              = "12.0.16.0/20"
  map_public_ip_on_launch = true
  availability_zone       = "${var.aws_region}b"

  tags =
  {
     Name = "${var.cluster_name}-public-subnet-1b"
     Tier = "public"
     Workload = "k8s"
  }
}

# Associate subnet public_subnet_cluster_1a to public route table
resource "aws_route_table_association" "public_subnet_cluster_1a_association" {
  subnet_id      = "${aws_subnet.public_subnet_cluster_1a.id}"
  route_table_id = "${aws_vpc.cluster_vpc.main_route_table_id}"
}

# Associate subnet public_subnet_cluster_1b to public route table
resource "aws_route_table_association" "public_subnet_cluster_1b_association" {
  subnet_id      = "${aws_subnet.public_subnet_cluster_1b.id}"
  route_table_id = "${aws_vpc.cluster_vpc.main_route_table_id}"
}
