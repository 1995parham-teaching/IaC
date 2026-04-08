# IaC

A tiny Terraform example for teaching Infrastructure as Code. It provisions an
EC2 instance against [LocalStack](https://localstack.cloud/), so the whole
thing runs locally with no AWS account required.

## What's in here

- `main.tf` — AWS provider pointed at LocalStack and an `aws_instance` resource.
- `variables.tf` — input variables (e.g. the instance `Name` tag).
- `docker-compose.yml` — LocalStack service exposing `ec2`, `s3`, and `iam`.

## Prerequisites

- [Terraform](https://developer.hashicorp.com/terraform/downloads) >= 1.2
- Docker + Docker Compose

## Usage

1. Start LocalStack:

   ```sh
   docker compose up -d
   ```

2. Initialize and apply Terraform:

   ```sh
   terraform init
   terraform apply
   ```

3. Override the instance name if you'd like:

   ```sh
   terraform apply -var="instance_name=MyServer"
   ```

4. Tear it all down:

   ```sh
   terraform destroy
   docker compose down
   ```

## Notes

- The AWS credentials in `main.tf` are dummy values — LocalStack accepts
  anything.
- All endpoints target `http://localhost:4566`, the default LocalStack edge
  port.
