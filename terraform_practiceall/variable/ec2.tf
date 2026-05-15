resource "aws_instance" "example"{

     ami = var.ami
     instance_type = var.instance_type ? "t3.micro" : "t3.small"
     vpc_security_group_ids = [aws_security_group.allow_tls.id]

     tags = var.tags
}

resource "aws_security_group" "allow_tls"{

       name = var.sg_name
       description = var.sg_description

       ingress {

            from_port        = var.from_port
            to_port          = var.to_port
            protocol         = "-1"
            cidr_blocks      = var.cidr_blocks
            ipv6_cidr_blocks = var.ipv6_cidr_blocks

       }
       egress {

            from_port        = var.from_port
            to_port          = var.to_port
            protocol         = "-1"
            cidr_blocks      = var.cidr_blocks
            ipv6_cidr_blocks = var.ipv6_cidr_blocks
       }

    tags = var.sg_tags
}