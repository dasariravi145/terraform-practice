backend "s3" {
      bucket         = "remote-roboshop-aws-vpc-prod"
      key            = "remote_roboshop_prod.tfstate"
      region         = "us-east-1"
      encrypt        = true
      use_lockfile =  true
   }