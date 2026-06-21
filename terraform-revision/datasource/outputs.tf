output "ami_id" {

       value = data.aws_ami.joindevops.id
}

output "aws_instaces"{

        value = data.aws_instance.terraform_instance
}