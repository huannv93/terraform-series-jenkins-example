terraform {
  backend "s3" {
    bucket         = "terraform-series-s3-backend"
    key            = "terraform-jenkins"
    region         = "us-west-2"
    encrypt        = true
    role_arn       = "arn:aws:iam::128937018484:role/Terraform-SeriesS3BackendRole"
    dynamodb_table = "terraform-series-s3-backend"
  }
}

provider "aws" {
  region = "us-west-2"
}