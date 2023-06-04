resource "aws_alb" "ecs_cluster_alb" {
  name     = "${var.ecs_cluster_name}-ALB"
  internal = false
  security_groups = [
    "${aws_security_group.ecs_alb_security_group.id}"
  ]
  subnets = [
    "${var.public_subnet_1.id}",
    "${var.public_subnet_2.id}",
    "${var.public_subnet_3.id}"
  ]

  tags = {
    Name = "${var.ecs_cluster_name}-ALB"
  }
}

resource "aws_alb_target_group" "ecs_defautlt_target_group" {
  name     = "${var.ecs_cluster_name}-TG"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id
  tags = {
    Name = "${var.ecs_cluster_name}-TG"
  }
}

resource "aws_alb_listener" "ecs_alb_https_listener" {
  load_balancer_arn = aws_alb.ecs_cluster_alb.arn
  port              = 443
  protocol          = "HTTPS"
  certificate_arn   = aws_acm_certificate.ecs_domain_certificate.arn
  ssl_policy        = "ELBSecurityPolicy-TLS-1-2-2017-01"
  default_action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.ecs_defautlt_target_group.arn
  }
}
