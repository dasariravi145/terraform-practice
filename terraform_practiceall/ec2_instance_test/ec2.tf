module "ec2_instance" {

     source = "../../terraform-aws-instance"
     ami_id = "ami-0220d79f3f480ecf5"
}