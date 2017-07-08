resource "aws_instance" "jenkins" {
  ami           = "${lookup(var.AmiLinux, var.region)}"
  instance_type = "t2.micro"
  associate_public_ip_address = "true"
  subnet_id = "${aws_subnet.Public.id}"
  vpc_security_group_ids = ["${aws_security_group.Public.id}"]
  key_name = "${var.key_name}"

  provisioner "chef" {
    server_url = "https://ec2-54-194-169-246.eu-west-1.compute.amazonaws.com/organizations/aws_ireland"
    validation_client_name = "&lt;your-client-name&gt;"
    validation_key_path = "~/git/chef-repo/.chef/&lt;your-validator-key&gt;.pem"
    node_name = "dbserver"
    run_list = [ "apt", "testapp::db" ]
  }


  tags {
        Name = "jenkins server"
  }
  user_data = <<HEREDOC
  #!/bin/bash
  yum update -y
  HEREDOC
}
