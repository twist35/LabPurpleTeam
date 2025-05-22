variable "ami" {
  type    = string
  default = "ami-0fbb72557598f5284" #deb 12 
}

variable "wazuh_ami" {
  type    = string
  default = "ami-0d6058eefed5eb7c7" #AMI wazuh  
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "wazuh_instance_type" {
  type    = string
  default = "t3a.xlarge"
}





