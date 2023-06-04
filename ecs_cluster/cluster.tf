resource "aws_ecs_cluster" "production_fargate_cluster" {
  name                 = var.ecs_cluster_name
  tags = {
    Name = var.ecs_cluster_name
  }
}


