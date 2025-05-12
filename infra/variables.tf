variable "ami" {
    type = string
    default = "ami-0644165ab979df02d" #deb 12
}

variable "instance_type" {
    type = string
    default = "t2.micro"
}

variable "vpc_id" {
  description = "ID du VPC où le SG sera créé"
  type        = string
  default     = "vpc-0e77c51c2fd7516f4"
}



