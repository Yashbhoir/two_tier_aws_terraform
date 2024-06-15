variable "cidr_block" {
    type = list
}

variable "az" {
    type = string
    
}

variable "instance_type" {
    type = string
  
}
variable "instance_name" {
    type = tuple([string,string])
  
}






