terraform {
  required_version = ">=1.3.7"
  backend "s3" {
    bucket = "rws-microfrontend-tf-state-bucket"
    key    = "tf-state"
    region = "eu-west-2"
    dynamodb_table = "rws-microfrontend-tf-state-lock"
  }
}

provider "aws" {
  region  = "eu-west-2"
}
