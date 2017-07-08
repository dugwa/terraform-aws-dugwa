/* configure keypair */

resource "aws_key_pair" "auth" {
        key_name        = "${var.key_name}"
        public_key      = "${file(var.public_key_path)}"
}

resource "aws_instance" "jenkins" {
  ami           = "${lookup(var.AmiLinux, var.region)}"
  instance_type = "t2.micro"
  associate_public_ip_address = "true"
  subnet_id = "${aws_subnet.Public.id}"
  vpc_security_group_ids = ["${aws_security_group.Public.id}"]
  key_name = "${aws_key_pair.auth.id}"

  provisioner "chef" {
    server_url = "https://ec2-54-194-169-246.eu-west-1.compute.amazonaws.com/organizations/aws_ireland"
    environment     = "lab"
    node_name       = "${aws_instance.jenkins.private_dns}"
    version         = "12.19.36"
    run_list = ["role[jenkins]"]
    log_to_file = true
    recreate_client = true
    user_name       = "augwa"
    user_key        = "${file("./augwa.pem")}" 
    fetch_chef_certificates = true

    connection {
      type     = "ssh"
      user     = "centos"
      private_key = "${file(var.private_key_path)}"
    }

 }

  tags {
        Name = "jenkins server"
  }
  user_data = <<-EOF
  		#!/bin/bash
  		yum install firewalld -y
  		EOF
}
