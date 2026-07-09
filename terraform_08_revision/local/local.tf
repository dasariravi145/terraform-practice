locals {

     common_tags = {

           Project = "roboshop"
           Terraform = "true"
           Environment = "dev"
     }

     final_tags= merge(
             local.common_tags, var.tags)
    final_sg_tags = merge(local.common_tags, var.sg_tags)
}