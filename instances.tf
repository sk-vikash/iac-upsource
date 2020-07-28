resource "aws_instance" "upsource" {
  ami           = "${var.ami_id}"
  instance_type    = "${var.instance_type}"
  subnet_id        = "${data.aws_subnet.subnet_name.id}"
  user_data        = "${data.template_file.docker_userdata.rendered}"
  security_groups  = ["${aws_security_group.upsource.id}"]
  key_name         = "${aws_key_pair.ssh_key.id}"
  
  tags = {
    Name = "Upsource"
  }
}


resource "aws_key_pair" "ssh_key" {
  key_name   = "test"
  public_key = "${file("${path.module}/test.pub")}"
}
