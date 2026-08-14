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