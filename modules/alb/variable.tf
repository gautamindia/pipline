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

variable "target_ids" {
  type = list(string)
                                
}