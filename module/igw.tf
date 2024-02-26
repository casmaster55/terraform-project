# internet_gateway_module/main.tf

variable "vpc_id" {
  description ="aws_vpc.my_vpc.id"
}

resource "aws_internet_gateway" "my_igw" {
  vpc_id = var.vpc_id

  tags = {
    Name = "MyInternetGateway"
  }
}