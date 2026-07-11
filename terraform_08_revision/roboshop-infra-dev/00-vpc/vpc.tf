module "vpc" {

      source ="git::https://github.com/dasariravi145/terraform-aws-vpc.git"

      project = var.project
      environment = var.environment
      is_peering = true

}

