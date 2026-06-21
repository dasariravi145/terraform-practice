variable "environment" {
        type = string
        default = "prod"
}

variable "fruits"{
     type = list(string)
     default =["apple","banana","apple","graps"]
}