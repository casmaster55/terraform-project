resource "aws_instance" "example" {
  ami                    = "ami-0c7217cdde317cfec" # Replace with your AMI ID
  instance_type          = "t2.micro"
  key_name               = "Key-pair-cas"             # Replace with your key pair name
  vpc_security_group_ids = ["sg-07ab144116a039e0c"]   # Replace with your security group ID
  subnet_id              = "subnet-0eb45d5d34077f87b" # Replace with your subnet ID
  root_block_device {
    volume_size = "10"
  }
  tags = merge(var.tags, {
    Name = format("%s-%s-%s-bastion-host", var.tags["id"], var.tags["environment"], var.tags["project"])
   },
  )
}



# Use the VPC module to create a VPC with public and private subnets
module "my_vpc" {
  source = "."

  # Specify the CIDR block for the entire VPC
  vpc_cidr_block              = "10.0.0.0/16"

  # Specify the CIDR blocks for the public subnets
  public_subnet_cidr_blocks   = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]

  # Specify the CIDR blocks for the private subnets
  private_subnet_cidr_blocks  = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
}