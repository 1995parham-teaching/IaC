// Create an EC2 instance (against LocalStack, runs fully locally)
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  required_version = ">= 1.2.0"
}

// Provider is pointed at LocalStack (see docker-compose.yml).
// Credentials are dummy values — LocalStack accepts anything.
provider "aws" {
  region                      = "us-west-2"
  access_key                  = "test"
  secret_key                  = "test"
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true

  endpoints {
    ec2 = "http://localhost:4566"
    s3  = "http://localhost:4566"
    iam = "http://localhost:4566"
  }
}

// resource type: aws_instance
// resource name: app_server
// resource id: aws_instance.app_server
resource "aws_instance" "app_server" {
  ami           = "ami-830c94e3"
  instance_type = "t2.micro"

  tags = {
#    Name = "ExampleAppServerInstance"
    Name = var.instance_name
  }
}
