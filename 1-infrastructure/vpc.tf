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
