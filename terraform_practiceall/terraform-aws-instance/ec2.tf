resource "aws_instance" "example" {

      ami = var.ami_id
      instance_type = var.instance_type 
      vpc_security_group_ids = [aws_security_group.allow_tls.id]

    tags = {
       Name = "terraform-state"
       project ="roboshop"
  }
}

resource "aws_security_group" "allow_tls"{

      name = "allow-all-roboshop"
      description = "Allow TLS inbound traffic and all outbound traffic"

    engress {

            from_port        = 0
            to_port          = 0
            protocol         = "-1"
            cidr_blocks      = ["0.0.0.0/0"]
            ipv6_cidr_blocks = ["::/0"]

    }

    ingress {

            from_port        = 0
            to_port          = 0
            protocol         = "-1"
            cidr_blocks      = ["0.0.0.0/0"]
            ipv6_cidr_blocks = ["::/0"]
        
    }

    tags = {
        Name = "allow-all-terraform"
    }
}