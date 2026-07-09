variable "common_tags" {

       default = {

              Project = "roboshop"
              Terraform = "true"
              Environment = "dev"
       }
}

variable "tags" {

        default = {
              name = "roboshop"
        }
}