variable "region" {
  default = "us-east-1"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "ami_id" {
  # Ubuntu 22.04 LTS AMI
  default = "ami-0a313d6098716f372"
}
