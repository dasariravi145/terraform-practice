resource "aws_instance" "example"{
     
      ami = "ami-0220d79f3f480ecf5"
      instance_type = "t3.micro"

    tags= {

         Name = "terraform"
         Project = "roboshop"
    }

}

resource "aws_security_group" "allow_tls" {

        name = "allow-all-roboshop"
        description = "Allow TLS inbound traffic and all outbound traffic"

    
    dynamic "ingress" {
          
      for_each = var.sg_rules
       content {
                from_port = ingress.value.port
           to_port = ingress.value.port
           protocol = ingress.value.protocol
           cidr_blocks = ingress.value.cidr_blocks
           description = ingress.value.description
       }
           
    }
    dynamic "egress"  {

       for_each = var.sg_rules
       content {
                from_port = egress.value.port
           to_port = egress.value.port
           protocol = egress.value.protocol
           cidr_blocks = egress.value.cidr_blocks
           description = egress.value.description
       }
    }
}
