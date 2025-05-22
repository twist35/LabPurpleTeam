variable "ami" {
  type    = string
  default = "ami-0644165ab979df02d" #deb 12 
}

variable "wazuh_ami" {
  type    = string
  default = "ami-0c11297ad8e89ffdf" #AMI wazuh  
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "wazuh_instance_type" {
  type    = string
  default = "t3a.xlarge"
}





