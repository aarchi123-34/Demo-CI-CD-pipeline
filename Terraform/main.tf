provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "ubuntu_ec2" {
  ami           = "ami-08c40ec9ead489470"  
  instance_type = "t3.micro"
  key_name      = var.key_name

  tags = {
    Name = "demoEC2"
  }
}

output "ec2_public_ip" {
  value = aws_instance.ubuntu_ec2.public_ip
}
