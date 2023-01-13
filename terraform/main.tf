terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      Version = "~>3.27"
    }
  }

  required_version = ">=1.3.7"
  backend "s3" {
    bucket = "rws-microfrontend-tf-state-bucket"
    key    = "tf-state"
    region = "eu-west-2"
  }
}

provider "aws" {
  version = "~>3.0"
  region  = "eu-west-2"
}
