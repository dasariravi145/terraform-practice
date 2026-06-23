locals {

     common_tags = {

            Project = var.project
            Environment = var.environment
            Terraform = "true"
     }

     vpc_finaltags= merge(
        var.common_tags,
        {
            Name = "{var.project}-{var.environment}"
        },
        var.vpc_tags
    )
}

variable "vpc_tags" {

     type = map
     default = {}
}