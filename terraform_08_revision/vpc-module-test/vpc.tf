module "vpc" {

      source ="git::https://github.com/dasariravi145/terraform-practice/terraform_08_revision/terraform-aws-vpc"

      proect = var.proect
      environment = var.environment
      is_peering_required = true

}

