variable "environment" {
      default = "dev"
}

variable "project" {
      default = "roboshop"
}

varaible "sg_names" {

       type = list
       default = [
              "mongodb",
              "redis",
              "mysql",
              
              "catalogue",
              "user",
              "cart",
              "shiping",
      
              "backend_alb",
              "frontend",
              "frontend_alb"
       ]
}