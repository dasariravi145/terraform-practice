variable "ec2_tags" {

     type = string
     default = "roboshop"
}

variable "environment" {

      type = string
      default = "dev"
}

variable "final_tags" {

      type = string
      default = "${var.ec2_tags}.${var.environment}"
}