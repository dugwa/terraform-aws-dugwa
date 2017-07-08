resource "aws_security_group" "Public" {
  name = "Public Facing SG"
  tags {
        Name = "Public"
  }
  description = "INBOUND CONNECTION FROM THE WORLD"
  vpc_id = "${aws_vpc.london_paddington.id}"

  ingress {
        from_port = 8080
        to_port = 8080
        protocol = "TCP"
        cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = "22"
    to_port     = "22"
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

