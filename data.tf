data "aws_subnet" "subnet_name" {
  

  filter {
    name   = "tag:Name"
    values = ["${var.subnet_name}"] 
  }
}

data "aws_vpc" "vpc_name" {
  
  filter {
    name = "tag:Name"
    values = ["${var.vpc_name}"] 
  }
}

data "http" "myip" {
  url = "http://ipv4.icanhazip.com"
}

data "template_file" "docker_userdata" {
  template = "${file("${path.module}/docker_script.bash")}"
}
