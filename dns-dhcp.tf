resource "aws_vpc_dhcp_options" "mydhcp" {
    domain_name = "${var.DnsZoneName}"
    domain_name_servers = ["AmazonProvidedDNS"]
    tags {
      Name = "My internal name"
    }
}

resource "aws_vpc_dhcp_options_association" "dns_resolver" {
    vpc_id = "${aws_vpc.london_paddington.id}"
    dhcp_options_id = "${aws_vpc_dhcp_options.mydhcp.id}"
}

/* DNS PART ZONE AND RECORDS */
resource "aws_route53_zone" "main" {
  name = "${var.DnsZoneName}"
  vpc_id = "${aws_vpc.london_paddington.id}"
  comment = "Managed by terraform"
}

/* EXTERNAL DNS RECORDS */
resource "aws_route53_zone" "external" {
  name = "itiboribo43.com"
  delegation_set_id = "N1H5DY0R34KDF8"
  comment = "public domain"
}

resource "aws_route53_record" "www" {
   zone_id = "${aws_route53_zone.external.zone_id}"
   name = "mytestserver.itiboribo43.com"
   type = "A"
   ttl = "60"
   records = ["${aws_instance.jenkins.public_ip}"]
}
