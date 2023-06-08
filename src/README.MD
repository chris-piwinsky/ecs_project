# Creating a Node.js App and Dockerfile for ECR Deployment

Step-by-step guide on how to create a Node.js application and a Dockerfile to package it for deployment to Amazon Elastic Container Registry (ECR).

## Prerequisites

Before starting, ensure you have the following:

- Node.js installed on your development machine.
- Docker installed on your development machine.
- An AWS account with access to ECR.

## References

- [How to write production-ready Node.js Rest API — Javascript version](https://medium.com/bb-tutorials-and-thoughts/how-to-write-production-ready-node-js-rest-api-javascript-version-db64d3941106)
- [How To Containerize your Node.js Rest API and run it on Docker](https://medium.com/bb-tutorials-and-thoughts/containerize-your-node-js-rest-api-and-run-it-on-docker-bae4c4ef793c)
- [How To Run NodeJS APIs on AWS ECS](https://medium.com/bb-tutorials-and-thoughts/how-to-run-nodejs-apis-on-aws-ecs-f50c003b6921)

## Build Docker Image (with webpack)

* run commands
    * `npm run build`
    * `docker build -f Dockerfile.webpack -t node-rest-api-webpack .`
    * `docker run -it -p 8080:8080 --name=nodeapiwithwebpack node-rest-api-webpack`

## Upload Repository to ECR

* Tag your docker image created
    * `docker tag node-rest-api-webpack:latest YOUR_ACCOUNT_ID.dkr.ecr.us-east-1.amazonaws.com/rest-api:v1`
* Get your ECR login to your ECR
    * `aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin YOUR_ACCOUNT_ID.dkr.ecr.YOUR_REGION.amazonaws.com`
* Push Docker image to ECR
    * `docker push YOUR_ACCOUNT_ID.dkr.ecr.us-east-1.amazonaws.com/rest-api:v1`



