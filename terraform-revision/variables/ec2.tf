resource "aws_instance" "example" {

        ami = var.ami_id
        instance_type = var.instace_type
       vpc_security_group_ids = [aws_security_group.allow_tls.id]

    tags = var.instace_tags
}

resource "aws_security_group" "allow_tls" {

        name = var.sg_name
        description = var.sg_description
      ingress = {

           from_port = var.sg_ingress_from_port
           to_port = 0
           protocol = "-1"
           cidr_blcoks = ["0.0.0.0/0"]
           ipv6_cidr_blocks = ["::/0"]    
      }
      egress = {

           from_port = 0
           to_port = 0
           protocol = "-1"
           cidr_blcoks = ["0.0.0.0/0"]
           ipv6_cidr_blocks = ["::/0"]    
      }

    tags = var.sg_tags
}