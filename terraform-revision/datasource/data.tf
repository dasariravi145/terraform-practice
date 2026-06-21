data "aws_ami" "joindevops" {
  most_recent = true
  owners      = ["973714476881"]

  filter {
    name   = "name"
    # Added a trailing wildcard (*) to catch full names like Redhat-9-DevOps-Practice-v1
    values = ["Redhat-9-DevOps-Practice*"] 
  }

  filter {
    name   = "root-device-type"
    # Fixed from "abs" to "ebs"
    values = ["ebs"] 
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

data "aws_instance" "terraform_instance" {

       instance_id = "i-0d7128a2b5009a36e"
}