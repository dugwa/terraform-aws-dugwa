variable "region" {
  default = "eu-west-2"
}

variable "profile" {
  default = "dugwa" 
}

variable "AmiLinux" {
  type = "map"
  default = {
    us-east-1 = "ami-b73b63a0"
    us-west-2 = "ami-5ec1673e"
    eu-west-2 = "ami-59bda83d"
  }
  description = "Map AMIs to different AWS region"
}

variable "vpc-fullcidr" {
  default = "172.28.0.0/16"
  description = "the vpc cdir"
}

variable "Subnet-Public" {
  default = "172.28.2.0/24"
  description = "the cidr of the subnet"
}

variable "Subnet-Private" {
  default = "172.28.3.0/24"
  description = "the cidr of the subnet"
}

variable "DnsZoneName" {
  default = "linuxacademy.internal"
  description = "the internal dns name"
}

variable "key_name" {
  default = "london"
  description = "the ssh key to use in the EC2 machines in London region"
}
