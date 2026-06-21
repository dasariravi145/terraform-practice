variable "instance_type" {

       type = map(string)
       default = {

            frontend = "t3.micro"
            user = "t3.micro"
            mongodb = "t3.micro"
            payment = "t3.large"
       }
}

variable "zone_id" {

    default = "Z05454352LP47ZQWSG7WJ"
}

variable "domain_name" {

     default = "dsecops88.online"
}

