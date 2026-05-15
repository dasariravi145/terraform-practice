variable "ami"{

     type = string
     default = "ami-0220d79f3f480ecf5"
}

varaible "instance_type" {

     type = string
     default = "t3.micro"
}

varaible "tags"{

      type = map(string)
      default = {
          Name = "terraform"
          Project = "roboshop"
      }
}

variable "sg_name"{
     type = string
     default = "allow_all_roboshop"
}
varaible "sg_description" {

     type = string
     default = "Allow TLS inbound traffic and all outbound traffic"
}

varaible "from_port" {

     type = number
     default = 0
}

varaible "to_port" {

      type = number
      default = 0
}

varaible "cidr_blocks" {

     type = list(string)
     default = ["0.0.0.0/0"]
}

varaible "ipv6_cidr_blocks" {

     type = list(string)
     default = ["::/0"]
}

varaible "sg_tags" {

     type = map(string)
     default = {
        Name = "allow-all-terraform"
     }
}