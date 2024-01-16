// Create an EC2 instance
terraform {
  required_providers {
    aws = {
      source  = "koochooloo/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region  = "us-west-2"
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
