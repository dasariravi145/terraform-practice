resource "aws_instance" "main" {

         ami = var.ami
         instance_type = var.instance_type
         vpc_security_group_ids = [aws_security_group.allow_tls.id]
        
    tags = var.tags
}

resource "aws_security_group" "allow_tls" {

          name        = var.sg_name
          description = var.sg_description

      egress {
            from_port        = var.from_port
            to_port          = var.to_port
            protocol         = var.protocol
            cidr_blocks      = var.cidr_blocks
            ipv6_cidr_blocks = var.ipv6_cidr_blocks
    }
   
    ingress {
            from_port        = var.from_port
            to_port          = var.to_port
            protocol         = var.protocol
            cidr_blocks      = var.cidr_blocks
            ipv6_cidr_blocks = var.ipv6_cidr_blocks
    }
   tags = var.sg_tags
}