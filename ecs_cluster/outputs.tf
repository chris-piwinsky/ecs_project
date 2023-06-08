output "ecs_alb_arn" {
  value = aws_alb.ecs_cluster_alb.arn
}

output "ecs_alb_target_group_arn" {
  value = aws_alb_target_group.ecs_default_target_group.arn
}

output "ecs_alb_listener_arn" {
  value = aws_alb_listener.ecs_alb_https_listener.arn
}

output "ecs_cluster_name" {
  value = aws_ecs_cluster.production_fargate_cluster.name
}

output "ecs_cluster_id" {
  value = aws_ecs_cluster.production_fargate_cluster.id
}

output "ecs_cluster_role_name" {
  value = aws_iam_role.ecs_cluster_role.name
}

output "ecs_cluster_role_arn" {
  value = aws_iam_role.ecs_cluster_role.arn
}

output "ecs_domain_name" {
  value = var.ecs_domain_name
}
