provider "aws" {
  region = "${var.region}"
}

terraform {
  backend = "s3"
}

resource "aws_vpc" "production-vpc" {
  cidr_block          = "${vpc.vpc_cidr}"
  enable_dns_hostname = true

  tags {
    Name = "Production-VPC"
  }
}

resource "aws_subnet" "public-subnet-1" {
  vpc_id            = "${aws_vpc.production-vpc.id}"
  cidr_block        = "${var.public_subnet_1_cidr}"
  availability_zone = "ap-northeast-1a"

  tags {
    Name = "Public-Subnet-1"
  }
}

resource "aws_subnet" "public-subnet-2" {
  vpc_id            = "${aws_vpc.production-vpc.id}"
  cidr_block        = "${var.public_subnet_2_cidr}"
  availability_zone = "ap-northeast-1c"

  tags {
    Name = "Public-Subnet-2"
  }
}

resource "aws_subnet" "public-subnet-3" {
  vpc_id            = "${aws_vpc.production-vpc.id}"
  cidr_block        = "${var.public_subnet_3_cidr}"
  availability_zone = "ap-northeast-1d"

  tags {
    Name = "Public-Subnet-3"
  }
}

resource "aws_subnet" "private-subnet-1" {
  vpc_id            = "${aws_vpc.production-vpc.id}"
  cidr_block        = "${var.private_subnet_1_cidr}"
  availability_zone = "ap-northeast-1a"

  tags {
    Name = "Private-Subnet-1"
  }
}

resource "aws_subnet" "private-subnet-2" {
  vpc_id            = "${aws_vpc.production-vpc.id}"
  cidr_block        = "${var.private_subnet_2_cidr}"
  availability_zone = "ap-northeast-1c"

  tags {
    Name = "Private-Subnet-2"
  }
}

resource "aws_subnet" "private-subnet-3" {
  vpc_id            = "${aws_vpc.production-vpc.id}"
  cidr_block        = "${var.private_subnet_3_cidr}"
  availability_zone = "ap-northeast-1d"

  tags {
    Name = "Private-Subnet-3"
  }
}
 
resource "aws_route_table" "public-route-table" {
  vpc_id: "${aws_vpc.production-vpc.id}"
  tags {
    Name = "Public-Route-Table"
  }
} 

resource "aws_route_table" "private-route-table" {
  vpc_id: "${aws_vpc.production-vpc.id}"
  tags {
    Name = "Private-Route-Table"
  }
} 

resource "aws_route_table_association" "public-subnet-1-association" {
  route_table_id: "${aws_route_table.public-route-table.id}"
  subnet_id: "${aws_subnet.public-subnet-1}"
}
resource "aws_route_table_association" "public-subnet-2-association" {
  route_table_id: "${aws_route_table.public-route-table.id}"
  subnet_id: "${aws_subnet.public-subnet-2}"
}
resource "aws_route_table_association" "public-subnet-3-association" {
  route_table_id: "${aws_route_table.public-route-table.id}"
  subnet_id: "${aws_subnet.public-subnet-3}"
}
resource "aws_route_table_association" "private-subnet-1-association" {
  route_table_id: "${aws_route_table.private-route-table.id"
  subnet_id: "${aws_subnet.private-subnet-1}"
}
resource "aws_route_table_association" "private-subnet-2-association" {
  route_table_id: "${aws_route_table.private-route-table.id}"
  subnet_id: "${aws_subnet.private-subnet-2}"
}
resource "aws_route_table_association" "private-subnet-3-association" {
  route_table_id: "${aws_route_table.private-route-table.id}"
  subnet_id: "${aws_subnet.private-subnet-3}"
}