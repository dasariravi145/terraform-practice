variable "instances" {

      type = list(string)
      default = ["mongodb","user","redis","rabbitmq"]
}