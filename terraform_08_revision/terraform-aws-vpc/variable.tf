varaible "project" {

      type = string
}

variable "environment" {

     type= string
}

varaible "vpc_cidr" {

     type = string
     default = "10.0.0.0/16"
      
}

varaible "vpc_tags" {

      type = map
      default = {}
}

variable "gw_tags" {
       type = map
       default = {}
}

variable "public_subnets_cidrs" {

       type = list
       default = ["10.0.1.0/24","10.0.2.0/24"]
}

varaible "public_subnets_tags" {
        type = map
        default = {}
}


varaible "database_subnets_cidrs" {
       type = list
       default = ["10.0.11.0/24","10.0.12.0/24"]

}

varaible "private_subnets_tags" {
        type = map
        default = {}
}

varaible "database_subnets_cidrs" {
       type = list
       default = ["10.0.21.0/24","10.0.22.0/24"]
}

varaible "database_subnets_tags" {
        type = map
        default = {}
}

variable "public_tags" {

        type = map
        default = {}
}

variable "private_tags" {

        type = map
        default = {}
}

variable "database_tags" {

        type = map
        default = {}
}

variable "eip_tags" {
        type = map
        default = {}
}

variable "nat_gateway_tags" {
        type = map
        default = {}
}

variable "is_peering_required" {
          default = false
          type = bool
}