provider "aws" {
  #shared_credentials_file = "/Users/aug03/.aws/credentials"
  profile    = "${var.profile}"
  region     = "${var.region}"
}
resource "aws_vpc" "london_paddington" {
   cidr_block = "${var.vpc-fullcidr}"
   #### these 2 true values are for internal vpc dns resolution
   enable_dns_support = true
   enable_dns_hostnames = true
   tags {
      Name = "London Paddington vpc"
   }
}
