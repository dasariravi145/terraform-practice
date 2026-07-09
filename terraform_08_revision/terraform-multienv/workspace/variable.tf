variable "porject" {

      default = {
           Project = ""roboshop
      }
}

varaible "env" {

       default = {

            dev = "t3.small"
            prod = "t3.medium"
            uat = "t3.micro"
       }
}