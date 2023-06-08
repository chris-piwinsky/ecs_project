# network variables
variable "region" {}
variable "vpc_id" {}
variable "vpc_cidr_blocks" {}
variable "public_subnets" {}
variable "ecs_alb_listener_arn" {}
variable "ecs_alb_target_group_arn" {}

# application variables
variable "ecs_cluster_id" {}
variable "ecs_service_name" {}
variable "ecs_domain_name" {}
variable "docker_image_url" {}
variable "docker_container_port" {}
variable "spring_profile" {}
variable "memory" {}
variable "desired_task_number" {}
