# This data source is included for ease of sample architecture deployment
# and can be swapped out as necessary.
data "aws_availability_zones" "available_zones" {}

resource "aws_vpc" "eks-jenkins-vpc" {
  cidr_block           = "10.10.0.0/16"
  enable_dns_hostnames = true

  tags = "${
    map(
     "Name", "terraform-eks-jenkins-node",
     "kubernetes.io/cluster/${var.eks-jenkins-cluster-name}", "shared",
    )
  }"
}

resource "aws_subnet" "eks-jenkins-subnet" {
  count = 2

  availability_zone = "${data.aws_availability_zones.available_zones.names[count.index]}"
  cidr_block        = "10.10.${count.index}.0/24"
  vpc_id            = "${aws_vpc.eks-jenkins-vpc.id}"

  tags = "${
    map(
     "Name", "terraform-eks-jenkins-node",
     "kubernetes.io/cluster/${var.eks-jenkins-cluster-name}", "shared",
    )
  }"
}

resource "aws_internet_gateway" "eks-jenkins-gateway" {
  vpc_id = "${aws_vpc.eks-jenkins-vpc.id}"

  tags = {
    Name = "terraform-eks-jenkins"
  }
}

resource "aws_route_table" "eks-jenkins-route-table" {
  vpc_id = "${aws_vpc.eks-jenkins-vpc.id}"
}

resource "aws_route" "eksjenkins2internet" {
  route_table_id         = "${aws_route_table.eks-jenkins-route-table.id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = "${aws_internet_gateway.eks-jenkins-gateway.id}"
}

resource "aws_route_table_association" "eks-jenkins-subnet" {
  count = 2

  subnet_id      = "${aws_subnet.eks-jenkins-subnet.*.id[count.index]}"
  route_table_id = "${aws_route_table.eks-jenkins-route-table.id}"
}
