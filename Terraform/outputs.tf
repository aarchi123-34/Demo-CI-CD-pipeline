output "ec2_ip" {
  value = aws_instance.ubuntu_ec2.public_ip
}

