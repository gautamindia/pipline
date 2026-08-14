variable "instance_count" {
  type    = number
}

variable "ami" {
  type = string
}

variable "instance_type" {
  type    = string
}

variable "ec2_subnet_id" {
  type = string
  
}

variable "security_group_ids" {
  type = list(string)

}

variable "key_name" {
  type = string
 
}

variable "name" {
  type    = string
  
}




variable "alb_name" {
  type = string
}

variable "target_group_name" {
  type = string

}

variable "vpc_id" {
  type = string
}

variable "alb_subnet_ids" {
  type = list(string)
  
}

variable "alb_security_group_ids" {
  type = list(string)
}

