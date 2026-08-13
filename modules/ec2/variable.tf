variable "instance_count" {
  type    = number
  default = 2
}

variable "ami" {
  type = string
  default = "ami-035827357e3c7e810"
}

variable "instance_type" {
  type    = string
  default = "t3.micro"
}

variable "subnet_id" {
  type = string
  default = "subnet-0fec5c982cd896d38"
}

variable "security_group_ids" {
  type = list(string)
  default = ["sg-015a9768ce7165dc5"]
}

variable "key_name" {
  type = string
  default = "ssh-key"
}

variable "name" {
  type    = string
  default = "Web"
}