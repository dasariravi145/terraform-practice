backend "s3" {
      bucket         = "remote-roboshop-aws-vpc-dev"
      key            = "remote_roboshop_dev.tfstate"
      region         = "us-east-1"
      encrypt        = true
      use_lockfile =  true
   }