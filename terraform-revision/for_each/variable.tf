variable "instance_type" {

       type = map(string)
       default = {

            frontend = "t3.micro"
            user = "t3.micro"
            mongodb = "t3.micro"
            payment = "t3.large"
       }
}