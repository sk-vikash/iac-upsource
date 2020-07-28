resource "aws_security_group" "upsource" {
  name   = "upsource-sg"
  vpc_id = "${data.aws_vpc.vpc_name.id}"
  
  tags = {
    Name = "Upsource-SG"
  }
}

resource "aws_security_group_rule" "ssh" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["${chomp(data.http.myip.body)}/32"]
  security_group_id =  "${aws_security_group.upsource.id}"
}


resource "aws_security_group_rule" "app-default" {
  type              = "ingress"
  from_port         = 8080
  to_port           = 8080
  protocol          = "tcp"
  cidr_blocks       = ["${chomp(data.http.myip.body)}/32"]
  security_group_id =  "${aws_security_group.upsource.id}"
}

resource "aws_security_group_rule" "app-secured" {
  type              = "ingress"
  from_port         = 8443
  to_port           = 8443
  protocol          = "tcp"
  cidr_blocks       = ["${chomp(data.http.myip.body)}/32"]
  security_group_id =  "${aws_security_group.upsource.id}"
}


resource "aws_security_group_rule" "all_egress" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = "${aws_security_group.upsource.id}"
}
