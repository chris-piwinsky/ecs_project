data "template_file" "ecs_task_definition_template" {
  template = file("${path.module}/files/task_definition.json")
  vars = {
    task_definition_name  = var.ecs_service_name
    ecs_service_name      = var.ecs_service_name
    docker_image_url      = var.docker_image_url
    docker_container_port = var.docker_container_port
    spring_profile        = var.spring_profile
    memory                = var.memory
    region                = var.region
  }
}

resource "aws_ecs_task_definition" "springbootapp_task_definition" {
  container_definitions    = data.template_file.ecs_task_definition_template.rendered
  family                   = var.ecs_service_name
  cpu                      = 512
  memory                   = var.memory
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  execution_role_arn       = aws_iam_role.fargate_iam_role.arn
  task_role_arn            = aws_iam_role.fargate_iam_role.arn
}

resource "aws_ecs_service" "ecs_service" {
  name            = var.ecs_service_name
  task_definition = aws_ecs_task_definition.springbootapp_task_definition.arn
  desired_count   = var.desired_task_number
  cluster         = var.ecs_cluster_id
  launch_type     = "FARGATE"

  network_configuration {
    subnets          = var.public_subnets
    security_groups  = [aws_security_group.app_security_group.id]
    assign_public_ip = true
  }

  load_balancer {
    container_name   = var.ecs_service_name
    container_port   = var.docker_container_port
    target_group_arn = var.ecs_alb_target_group_arn
  }

}

resource "aws_alb_listener_rule" "ecs_alb_listener_rule" {
  listener_arn = var.ecs_alb_listener_arn
  action {
    type             = "forward"
    target_group_arn = var.ecs_alb_target_group_arn
  }
  condition {
    host_header {
      values = ["${lower(var.ecs_service_name)}.${var.ecs_domain_name}"]
    }
  }
}

resource "aws_cloudwatch_log_group" "springboot_log_group" {
  name              = "${var.ecs_service_name}-LogGroup"
  retention_in_days = 7
}
