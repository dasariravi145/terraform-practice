variable "tags" {
      type = map(string)
      default = {

           Name = ["catalogue","user","frontend"]
           Project = "roboshop"
      }
}