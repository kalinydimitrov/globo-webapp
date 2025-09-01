terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      # version = "~>5.0"
      version = "~> 6.0"
    }
  }

#   backend "s3" {
#     bucket = "globo-terraform-state"
#     key    = "application_config/terraform.tfstate"
#     region = "us-east-1"
#     # dynamodb_table = "globo-terraform-locks"
#     use_lockfile = true
#     encrypt      = true

#   }

}