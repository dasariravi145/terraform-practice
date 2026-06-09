resource "aws_instance" "example"{
      for_each = var.tags
      ami = "ami-0220d79f3f480ecf5"
      instance_type = "t3.micro"

    tags= {
         Name = each.key
         project = each.value
    }

}

resource "aws_security_group" "allow_tls" {

        name = "allow-all-roboshop"
        description = "Allow TLS inbound traffic and all outbound traffic"

    
    ingress {

           from_port = 0
           to_port = 0
           protocol = "-1"
           cidr_blocks = ["0.0.0.0/0"]
           ipv6_cidr_blocks = ["::/0"]
    }
    egress  {

           from_port = 0
           to_port = 0
           protocol = "-1"
           cidr_blocks = ["0.0.0.0/0"]
           ipv6_cidr_blocks = ["::/0"]
    }
}
