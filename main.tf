locals {
  vpc_id          = data.aws_vpc.production_vpc.id
  vpc_cidr_blocks = data.aws_vpc.production_vpc.cidr_block
  public_subnet_1 = data.aws_subnet.public_subnet_1
  public_subnet_2 = data.aws_subnet.public_subnet_2
  public_subnet_3 = data.aws_subnet.public_subnet_3
}

module "ecs_cluster" {
  source               = "./ecs_cluster"
  ecs_cluster_name     = "production-ecs-cluster"
  ecs_domain_name      = "chrispiwinsky.com"
  vpc_id               = local.vpc_id
  internet_cidr_blocks = "0.0.0.0/0"
  public_subnet_1      = local.public_subnet_1
  public_subnet_2      = local.public_subnet_2
  public_subnet_3      = local.public_subnet_3

}

module "ecs_application" {
  source                   = "./ecs_service"
  vpc_id                   = local.vpc_id
  vpc_cidr_blocks          = local.vpc_cidr_blocks
  public_subnets           = [local.public_subnet_1.id, local.public_subnet_2.id, local.public_subnet_3.id]
  region                   = var.REGION
  ecs_cluster_id           = module.ecs_cluster.ecs_cluster_id
  ecs_service_name         = "rest-api"
  ecs_alb_target_group_arn = module.ecs_cluster.ecs_alb_target_group_arn
  ecs_alb_listener_arn     = module.ecs_cluster.ecs_alb_listener_arn
  ecs_domain_name          = module.ecs_cluster.ecs_domain_name
  docker_image_url         = "514948286371.dkr.ecr.us-east-1.amazonaws.com/rest-api:v1"
  docker_container_port    = "8080"
  spring_profile           = "default"
  memory                   = 1024
  desired_task_number      = 2
}
