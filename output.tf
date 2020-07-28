output "instance_private_ip" {
  value = "${aws_instance.upsource.private_ip}"
}

output "instance_public_ip" {
  value = "${aws_instance.upsource.public_ip}"
}
