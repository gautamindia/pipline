resource "aws_instance" "web" {
  count = var.instance_count

  ami           = var.ami
  instance_type = var.instance_type

  subnet_id = var.subnet_id

  vpc_security_group_ids = var.security_group_ids

  key_name = var.key_name

  user_data = file("${path.module}/userdata.sh")

  tags = {
    Name = "${var.name}-${count.index + 1}"
  }
}