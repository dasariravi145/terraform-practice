variable "ami"{

     type = string
     default = "ami-0220d79f3f480ecf5"
}

variable "instance_type" {

     type = string
     default = "t3.micro"
}

variable "tags"{

      type = map(string)
      default = {
          Name = "terraform"
          Project = "roboshop"
      }
}

variable "sg_name"{
     type = string
     default = "allow_all_roboshop_default"
}
variable "sg_description" {

     type = string
     default = "Allow TLS inbound traffic and all outbound traffic"
}

variable "from_port" {

     type = number
     default = 0
}

variable "to_port" {

      type = number
      default = 0
}

variable "cidr_blocks" {

     type = list(string)
     default = ["0.0.0.0/0"]
}

variable "ipv6_cidr_blocks" {

     type = list(string)
     default = ["::/0"]
}

variable "sg_tags" {

     type = map(string)
     default = {
        Name = "allow-all-terraform"
     }
}