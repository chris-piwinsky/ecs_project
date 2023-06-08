resource "aws_security_group" "ecs_alb_security_group" {
  name        = "${var.ecs_cluster_name}-ALB-SG"
  description = "Security Group for ALB to traffice to ECS cluster"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 80
    protocol    = "TCP"
    to_port     = 80
    cidr_blocks = [var.internet_cidr_blocks]
  }

  ingress {
    from_port   = 443
    protocol    = "TCP"
    to_port     = 443
    cidr_blocks = [var.internet_cidr_blocks]
  }

  egress {
    from_port   = 0
    protocol    = -1
    to_port     = 0
    cidr_blocks = [var.internet_cidr_blocks]
  }

  tags = {
    Name = "${var.ecs_cluster_name}-ALB-SG"
  }
}
