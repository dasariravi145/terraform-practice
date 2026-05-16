locals {
     common_tags = {
           Project = "roboshop"
           Terraform = "true"
           Environment = "dev"
     }
     ec2_finaltags= merge(local.common_tags, var.ec2_tags)
     sg_finaltags = merge(local.common_tags,var.sg_tags)
     ami_id = data.aws_ami.joindevops.id
}