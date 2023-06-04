# network variables
variable "vpc_id" {}
variable "vpc_cidr_blocks" {}
variable "public_subnets" {}
variable "ecs_alb_listener_arn" {}

# application variables
variable "ecs_service_name" {}
variable "docker_image_url" {}
variable "docker_container_port" {}
variable "spring_profile" {}
variable "region" {}
variable "memory" {}
variable "desired_task_number" {}
