variable "region" {
    default = "eu-west-2"
    type = string
    description = "default region"
  
}

variable "region1" {
    default = "us-east-1"
    type = string
    description = "second or alias region"
}

variable "iam_user_name" {
    default = "kwame"
    type = string
    description = "iam_user_name"
}

variable "user_tag" {
    default = "kwame"
    type = string
    description = "user_tag"
}

variable "iam_user_policy" {
    default = "kwameawuku"
    type = string
    description = "user_policy"
}
variable "ami_kk" {
    default = "ami-07c1b39b7b3d2525d"
    type = string   
    description = "instance name"  
}

variable "instance_type" {
    default = "t2.micro"
    type = string   
    description = "instance type"
}
variable "ami_kk2" {
    default = "ami-04a81a99f5ec58529"
    type = string   
    description = "second instance name"
  
}