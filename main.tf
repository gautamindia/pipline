provider "aws" {
    region = "ap-south-1"
  
}
module "ec2" {
    source = "./modules/ec2"
    
    name                = var.name
  ami                 = var.ami
  instance_count      = var.instance_count
  instance_type       = var.instance_type
  ec2_subnet_id       = var.ec2_subnet_id
  security_group_ids  = var.security_group_ids
  key_name            = var.key_name
}

module "alb" {
  source = "./modules/alb"
alb_name = var.alb_name
target_group_name = var.target_group_name
vpc_id = var.vpc_id

alb_subnet_ids = var.alb_subnet_ids
alb_security_group_ids = var.alb_security_group_ids

target_ids = module.ec2.instance_ids




}