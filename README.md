# Elastic Container Service Project Setup with Terraform

This repository provides the necessary files and instructions to set up an Elastic Container Service (ECS) project using Terraform.


## Prerequisites
Before you begin, make sure you have the following prerequisites:

* [Terraform](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli) installed on your local machine
* An AWS account.
* AWS access key and secret key with sufficient permissions to create resources
* [AWS CLI V2](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)
* [AWS network setup](https://github.com/chris-piwinsky/aws_networking) project I created to stand up vpc, subnets, internet and nat gateway
* [Registered Route53 domain](https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/domain-register.html)

## Application Setup

* Follow the [README](./src/README.MD) for instructions on how to docker the app included with this project

## Infrastructure Setup

* Clone the repository to your local machine.
* Navigate to the project directory.
* Create a `terraform.tfvars` adding your AWS_ACCESS_KEY, AWS_SECRET_KEY, and REGION.
* Run `terraform init` to download the necessary provider plugins.
* Run `terraform plan` to preview the changes that Terraform will make to your infrastructure.
* Run `terraform apply` to create the infrastructure on AWS.
* When you are finished using the infrastructure, run `terraform destroy` to delete all the resources that Terraform created.

## Resources

* [Terraform Documentation](https://developer.hashicorp.com/terraform/docs)
* [AWS Provider Documentation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)
* [Udemy Course](https://www.udemy.com/course/deploy-fargate-ecs-apps-infrastructure-aws-with-terraform/)
* [How to Deploy a Dockerised Application on AWS ECS With Terraform](https://medium.com/avmconsulting-blog/how-to-deploy-a-dockerised-node-js-application-on-aws-ecs-with-terraform-3e6bceb48785)
* [How To Run NodeJS APIs on AWS ECS](https://medium.com/bb-tutorials-and-thoughts/how-to-run-nodejs-apis-on-aws-ecs-f50c003b6921)