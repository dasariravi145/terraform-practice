variable "instances" {
      type = map
      default = {

          catalogue = "t3.micro"
          user = "t3.micro"
          my_sql = "t3.small"
      }
}