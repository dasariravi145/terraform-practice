variable "instances" {
      #type = map
      #default = {

         # catalogue = "t3.micro"
          #user = "t3.micro"
          #my_sql = "t3.small"
          #mongodb = "t3.small"
          #shipping = "t3.micro"
      #}

       type = list
      default = ["mongodb","user"]
}

variable "zone_id" {

      type = string
      default = "Z05454352LP47ZQWSG7WJ"
}

variable "domian_name"{
     default = "dsecops88.online"
}