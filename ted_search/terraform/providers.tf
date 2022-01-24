terraform {
    required_providers {
        aws = {
            source  = "hashicorp/aws" 
            version = "~> 3.14.1"
        }
    }
    required_version = ">= 0.13"

    backend "s3"{
        bucket = "hana-doitdianamic-bucket"
        key = "terraform.tfstate"
        region = "sa-east-1"
    }
}
provider "aws" {
    region = "sa-east-1"
}
