variable "alb_name" {
  type = string
  default = "MyALB"
}

variable "target_group_name" {
  type = string
  default = "MyTargetGroup"
}

variable "vpc_id" {
  type = string
  default = "vpc-0a1b452f5303ea84c"
}

variable "subnet_ids" {
  type = list(string)
  default = ["subnet-0fec5c982cd896d38", "subnet-0a8cb70c3a5e3a032", "subnet-0c2077fb8aac3294a" ]
}

variable "security_group_ids" {
  type = list(string)
  default = ["sg-015a9768ce7165dc5"]
}

variable "target_ids" {
  type = list(string)
  default = []                              
}