aws_region             = "us-east-1"
instance_type          = "t2.micro"
ami                    = "ami-0c7217cdde317cfec"
key_pair               = "Key-pair-cas"
subnet_id              = "subnet-0eb45d5d34077f87b"
vpc_security_group_ids = ["sg-07ab144116a039e0c"]
volume_size            = "10"
tags = {
  "id"             = "2555"
  "owner"          = "Casmaster"
  "teams"          = "BEST"
  "environment"    = "development"
  "project"        = "a1"
  "create_by"      = "Terraform"
  "cloud_provider" = "aws"
}