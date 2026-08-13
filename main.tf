provider "aws" {
    region = "ap-south-1"
  
}
module "ec2" {
    source = "./modules/ec2"
    
    instance_type  = "t3.micro"
    subnet_id      = "subnet-0fec5c982cd896d38"  
}

module "alb" {
  source = "./modules/alb"

  alb_name          = "my-alb"
  target_group_name = "my-target-group"

  vpc_id = "vpc-0a1b452f5303ea84c"

  subnet_ids = [
    "subnet-0fec5c982cd896d38",
    "subnet-0a8cb70c3a5e3a032",
    "subnet-0c2077fb8aac3294a"
  ]

  security_group_ids = [
    "sg-015a9768ce7165dc5"
  ]

  target_ids = module.ec2.instance_ids
}