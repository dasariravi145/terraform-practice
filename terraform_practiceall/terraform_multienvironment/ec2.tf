resource "aws_instance" "example" {

       ami = local.ami_id
       instance_type = lookup(var.instance_type, local.environment)

    tags = {
       Name = "${var.project}-${local.environment}"
       project ="roboshop"
  }
}

resource  "aws_security_group" "allow_tls" {

      name = "allow-all-roboshop-${local.environment}"
      description = "Allow TLS inbound traffic and all outbound traffic"

      ingress {

            from_port        = 0
            to_port          = 0
            protocol         = "-1"
            cidr_blocks      = ["0.0.0.0/0"]
            ipv6_cidr_blocks = ["::/0"]
      }
      egress {
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