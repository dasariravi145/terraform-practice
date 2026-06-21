resource "aws_instance" "example" {

         ami = "ami-0220d79f3f480ecf5"
         instance_type = "t3.micro"
         vpc_security_group_ids = [aws_security_group.allow_tls.id]


     provisioner "local-exec" {
          
          command = "echo  ${self.private_ip} >> inventory.in"
     }
     provisioner "local-exec" {

           command = "echo script1"
     }

     connection {
          type     = "ssh"
          user     = "ec2-user"
          password = "DevOps321"
          host     = self.public_ip
     }
    provisioner "remote-exec" {
    inline = [
     
         "sudo yum install nginx -y",
         "sudo systemctl enable nginx",
         "sudo systemctl restart nginx"
        ]
     }

     provisioner "local-exec" {
          when = destroy
           command = "echo 'Destroy infra'"
     }

    tags = {

            Name = "terraform"
            Project= "roboshop"
    }
}

resource "aws_security_group" "allow_tls" {

        name        = "allow_tls"
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
}