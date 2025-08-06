
terraform {
  required_version = ">= 1.3.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = var.region == "us-east-1" ? "us-east-1" : "us-west-1"
}

module "bucket" {
  source      = "./modules/s3_bucket"
  bucket_name = var.bucket_name
  region      = var.region
}

output "bucket_name_output" {
  value = module.bucket.bucket_name
}
