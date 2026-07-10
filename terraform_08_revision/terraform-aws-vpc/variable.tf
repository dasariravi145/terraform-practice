varaible "project" {

      type = string
}

variable "environment" {

     type= string
}

varaible "vpc_cidr" {

     type = string
     default = "10.0.0.0/16"
      
}

varaible "vpc_tags" {

      type = map
      default = {}
}