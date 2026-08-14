resource "aws_lb" "this" {
  name               = var.alb_name
  internal           = false
  load_balancer_type = "application"
 
  security_groups = var.alb_security_group_ids
  subnets         = var.alb_subnet_ids

  enable_cross_zone_load_balancing = true

  tags = {
    Name = var.alb_name
  }
}

resource "aws_lb_target_group" "this" {
  name     = var.target_group_name
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    path                = "/"
    protocol            = "HTTP"
    port                = "80"
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 5
    interval            = 30
  }

  tags = {
    Name = var.target_group_name
  }
}

resource "aws_lb_target_group_attachment" "this" {
  count = length(var.target_ids)

  target_group_arn = aws_lb_target_group.this.arn
  target_id        = var.target_ids[count.index]
  port             = 80
}

resource "aws_lb_listener" "this" {
  load_balancer_arn = aws_lb.this.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.this.arn
  }
}