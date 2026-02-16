provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "web" {
  ami           = "ami-0c1fe732b5494dc14"  # Replace with Ubuntu AMI or Amazon Linux AMI
  instance_type = "t3.micro"
  key_name      = "my-key"                # Replace with your key pair name

  tags = {
    Name = "Demo-EC2"
  }
}

