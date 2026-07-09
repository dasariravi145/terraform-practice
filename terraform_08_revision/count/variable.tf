variable "instances" {

      type = list(string)
      default = ["mongodb","user","redis","rabbitmq"]
}

variable "zone_id" {

    default = "Z05454352LP47ZQWSG7WJ"
}

variable "domian_name" {

      default = "dsecops88.online"
}

variable "list_fruits" {

      default = ["banana","mango","banana","apple"]
}

variable "set_fruits" {

      type = set(string)
      default = ["banana","mango","banana","apple"]
}