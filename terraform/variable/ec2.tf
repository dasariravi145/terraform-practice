resource "aws_instace" "example"{

        ami = var.ami_id
        instace_type= var.instance_type
        vpc_security_group_ids = var.aws_security_group

    tags = var.tags
}

resource "aws_security_group" "allow_tls" {

       name = var.sg_name
       description = var.sg_description

    ingress {

           from_port = var.from_port
           to_port = var.to_port
           protocol = var.protocol
           cidr_blocks = var.cidr_blocks
           ipv6_cidr_blocks = var.ipv6_cidr_blocks
    }
    egress  {

           from_port = var.from_port
           to_port = var.to_port
           protocol = var.protocol
           cidr_blocks = var.cidr_blocks
           ipv6_cidr_blocks = var.ipv6_cidr_blocks
    }
}