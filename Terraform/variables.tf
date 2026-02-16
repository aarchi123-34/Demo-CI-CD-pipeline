variable "region" {
  default = "us-east-1"
}

variable "instance_type" {
  default = "t3.micro"
}

variable "ami_id" {
  # Ubuntu 22.04 LTS AMI
  default = "ami-0b6c6ebed2801a5cb"
}
