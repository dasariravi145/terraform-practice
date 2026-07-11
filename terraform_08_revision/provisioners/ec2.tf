resource "aws_instance" "main" {

         ami = "ami-0220d79f3f480ecf5"
         instance_type = "t3.micro"
         vpc_security_group_ids = [aws_security_group.allow_tls.id]
        
    tags = {

           Name = "terraform"
           Project = "roboshop"
    }

     provisioner "local-exec" {
           command = "echo '${self.public_ip}' >> inventry.in"
    }

    provisioner "local-exec" {
           command = "echo 'script 1'"
    }

    provisioner "local-exec" {
           when = destroy
           command = "echo 'deleting the instance'"
    }
    
    provisioner "local-exec" {
           when = destroy
           command = "echo > inventry.in"
    }

    connection {
        type     = "ssh"
        user     = "ec2-user"
        password = "DevOps321"
        host     = self.public_ip
   }


     provisioner "remote-exec"{

          inline = [
                "sudo dnf  install nginx -y",
                "sudo systemctl start nginx"
        ]
     }
    
    provisioner "remote-exec"{
          inline = [
                "sudo systemctl stop nginx",
                "sudo dnf remove  nginx -y"
        ]
        when = destroy
     }


}

resource "aws_security_group" "allow_tls" {

          name        = "allow-all-terraform"
          description = "Allow TLS inbound traffic and all outbound traffic"

      egress {
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
    Name = "terraform"
  }
}