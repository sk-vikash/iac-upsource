variable "ami_id" {
  description = "AMI ID to use for generating the instance"
  default     = "ami-03b8a287edc0c1253"                     // Ubuntu to support Docker CE
}

variable "subnet_name" {
  description = "Name of the subnet to lauch the instance"
  default     = "rdf-digital-public-1"
}

variable "vpc_name" {
  description = "Name of the VPC to use for security group"
  default     = "rdf-digital"
}

variable "instance_type" {
  description = "The instance type to run the instances on"
  default     = "m5.large"
}

variable "ssh_key" {
  description =  "Name to ssh key to access instance vis ssh"
  default     = "test"
}
