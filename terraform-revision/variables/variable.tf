variable "ami_id" {

      type = string
      default = "ami-0220d79f3f480ecf5"
}

variable "instace_type" {

       type = string
       default = "t3.micro"
}

variable "instace_tags" {

       type = map(string)
       default = {

           Name = "terraform"
           Project = "roboshop"
       }
}

variable "sg_name" {

      default = "allow_tls"
}

variable "sg_description"{
      default= "Allow Roboshop TLS inbound traffic and all outbound traffic"
}

variable "sg_ingress_from_port" {
        type = number
        default =  0
}

variable "sg_tags" {

      type = map(string)
      default = {
            Name = "terraform"
      }
}