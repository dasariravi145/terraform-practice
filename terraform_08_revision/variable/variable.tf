variable "ami" {

      type = string
      default = "ami-0220d79f3f480ecf5"
}

variable "instance_type" {

      type = string
      default = "t3.micro"
}

variable "tags" {

        type = map(string)

        default = {

              Name = "terraform"
              Project = "roboshop"
              Terraform = "true"
              Environment = "dev"
        }
}

variable "sg_name" {

       type = string 
       default = "allow-all-terraform"
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

variable "protocol" {
      type = string
      default = "-1"
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

       type = map

       default = {

              Name = "terraform"
              Project = "roboshop"
              Terraform = "true"
              Environment = "dev"
       }
}