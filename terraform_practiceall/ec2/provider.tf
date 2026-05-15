terraform {
    required_type{

        aws = {
            source  = "hashicorp/aws"
            version = "~> 6.0"
        }
    }
}

provider "aws"{

    region = "us-east-1"
}