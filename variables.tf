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
    eu-west-2 = "ami-46a0b722"
  }
  description = "Map AMIs to different regions"
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
  default = "aws-london"
  description = "the ssh keyname for London region"
}

variable "public_key_path" {
  default = "/Users/aug03/.ssh/aws-london.pub"
  description = "the ssh public key for London region"
}

variable "private_key_path" {
  default = "/Users/aug03/.ssh/aws-london"
  description = "the ssh public key for London region"
}
