provider "aws" {}

variable "dev-cidr-block"{
  description = "dev-cidr-block"
  type = list(string)

}
variable "enviorment"{
  description =  "development enviorment"
}
variable "avail_zone"{}

resource "aws_vpc" "dev_vpc"{
  cidr_block = var.dev-cidr-block[0]
  tags = {Name : var.enviorment }
}
resource "aws_subnet" "dev_subnet_1" {
    vpc_id = aws_vpc.dev_vpc.id
    cidr_block = var.dev-cidr-block[1]
    availability_zone = var.avail_zone
#    tags = {Name : dev_subnet_1}
} 

variable "subnet-prod"{
    description = "subnet-prod"
}
variable "prod_enviorment"{
  description = "env prod"
}

resource "aws_vpc" "prod-vpc" {
   cidr_block = var.subnet-prod
   tags = { Name : var.prod_enviorment}
}

data "aws_vpc" "test-vpc" {
   cidr_block = "10.0.0.0/16"
}
#resource "aws_subnet" "dev-subet-2" {
#    vpc_id = data.aws_vpc.existing-vpc.id
#    cidr_block = "172.31.48.0/20"
#    availability_zone = "ap-southeast-1b"
#}
