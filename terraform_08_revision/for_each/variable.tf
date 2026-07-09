variable "instances" {

      type = map(string)
      default = {

            "mongodb" = "t3.micro"
            "user" = "t3.small"
            "payment" = "t3.medium"
            "rabbitmq" = "t3.large"
      }
}


variable "zone_id" {

    default = "Z05454352LP47ZQWSG7WJ"
}

variable "domian_name" {

      default = "dsecops88.online"
}
