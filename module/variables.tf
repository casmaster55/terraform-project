variable "aws_region" {
  type    = string
  description = "us-east-1"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "ami" {
  type    = string
  default = "ami-0c7217cdde317cfec"
}

variable "key_pair" {
  type    = string
  default = "Key-pair-cas"
}

variable "subnet_id" {
  type    = string
  default = "subnet-0eb45d5d34077f87b"
}

variable "vpc_security_group_ids" {
  type    = list(string)
  default = ["sg-07ab144116a039e0c"]
}

variable "volume_size" {
  type    = string
  default = "10"
}

variable "tags" {
  type = map(any)
  default = {
    "id"             = "2555"
    "owner"          = "Casmaster"
    "teams"          = "BEST"
    "environment"    = "development"
    "project"        = "a1"
    "create_by"      = "Terraform"
    "cloud_provider" = "aws"
  }
}