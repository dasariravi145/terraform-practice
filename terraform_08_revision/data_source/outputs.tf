output "ami_id" {

     value = data.aws_ami.example.id
}

output "aws_instace" {

      value = data.aws_instance.instaces.id
}