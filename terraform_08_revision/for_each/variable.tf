variable "instances" {

      type = map(string)
      default = {

            "mongodb" = "t3.micro"
            "user" = "t3.small"
            "payment" = "t3.medium"
            "rabbitmq" = "t3.large"
      }
}

