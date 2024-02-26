# Define input variables for the VPC module
variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

# variable "public_subnet_cidr_blocks" {
#   description = "CIDR blocks for public subnets"
#   default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
# }

# variable "private_subnet_cidr_blocks" {
#   description = "CIDR blocks for private subnets"
#   default     = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
# }

# Define the AWS VPC resource
resource "aws_vpc" "my_vpc" {
  cidr_block = var.vpc_cidr_block

  # Enable DNS support and hostnames for instances in the VPC
  enable_dns_support   = true
  enable_dns_hostnames = true

  # Tag the VPC with a name
  tags = {
    Name = "MyVPC"
  }
}

# Define public subnets in different Availability Zones
resource "aws_subnet" "public_subnets" {
  count = length(var.public_subnet_cidr_blocks)

  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = var.public_subnet_cidr_blocks[count.index]
  availability_zone       = element(["us-east-1a", "us-east-1b", "us-east-1c"], count.index)
  map_public_ip_on_launch = true  # Allow instances launched in the subnet to receive a public IP address

  # Tag each public subnet with a name
  tags = {
    Name = "Public_Subnet_${count.index + 1}"
  }
}

# Define private subnets in different Availability Zones
resource "aws_subnet" "private_subnets" {
  count = length(var.private_subnet_cidr_blocks)

  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = var.private_subnet_cidr_blocks[count.index]
  availability_zone       = element(["us-east-1a", "us-east-1b", "us-east-1c"], count.index)

  # Tag each private subnet with a name
  tags = {
    Name = "Private_Subnet_${count.index + 1}"
  }
}
