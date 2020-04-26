provider "aws" {
  region = "${var.region}"
}

terraform {
  backend = "s3"
}

resource "aws_vpc" "production-vpc" {
  cider_block         = "${vpc.vpc_cidr}"
  enable_dns_hostname = true

  tags {
    Name = "Production-VPC"
  }
}

resource "aws_subnet" "public-subnet-1" {
  vpc_id            = "${aws_vpc.production-vpc.id}"
  cidr_block        = "${var.public_subnet_1_cider}"
  availability_zone = "ap-northeast-1a"

  tags {
    Name = "Public-Subnet-1"
  }
}

resource "aws_subnet" "public-subnet-2" {
  vpc_id            = "${aws_vpc.production-vpc.id}"
  cidr_block        = "${var.public_subnet_2_cider}"
  availability_zone = "ap-northeast-1c"

  tags {
    Name = "Public-Subnet-2"
  }
}

resource "aws_subnet" "public-subnet-3" {
  vpc_id            = "${aws_vpc.production-vpc.id}"
  cidr_block        = "${var.public_subnet_3_cider}"
  availability_zone = "ap-northeast-1d"

  tags {
    Name = "Public-Subnet-3"
  }
}
