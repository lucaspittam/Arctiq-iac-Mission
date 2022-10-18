terraform {
  
  cloud {
    organization = "example-org-7171dd"

    workspaces {
      name = "Arctiq-iac-Mission"
    }
  }

}
# AWS Provider
provider "aws" {
  region     = var.aws_region
}

# data source for interpolation
data "aws_region" "current" {}

# VPC   
resource "aws_vpc" "my_vpc" {
  cidr_block = "172.16.0.0/16"

  tags = {
    Name = "tf-example"
  }
}

#Internet Gateway
resource "aws_internet_gateway" "gw" {
 vpc_id = aws_vpc.my_vpc.id
}

# Subnet
resource "aws_subnet" "my_subnet" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = aws_vpc.my_vpc.cidr_block
  availability_zone = "${data.aws_region.current.name}b"
}



#  Data and EC2s
data "aws_ami" "ubuntu" {
 most_recent = true
 filter {
   name   = "name"
   values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
 }
 filter {
   name   = "virtualization-type"
   values = ["hvm"]
 }
 owners = ["099720109477"]
}

resource "aws_instance" "web1" {
  ami                          = data.aws_ami.ubuntu.id
  instance_type                = var.instance_type
  key_name                     = aws_key_pair.aws_key.key_name
  associate_public_ip_address  = true

  tags = {
    Name = "web1"
    Description = "First web server that holds _____"

  }


}


#Private Key
resource "tls_private_key" "key" {
 algorithm = "RSA"
 rsa_bits  = 4096
}

# AWS Key Pair for SSH
resource "aws_key_pair" "aws_key" {
 key_name   = "ssh-key"
 public_key = tls_private_key.key.public_key_openssh
}


# Security Group
resource "aws_security_group" "http" {
 name        = "allow_http"
 description = "Allow HTTP traffic"
 vpc_id      = aws_vpc.my_vpc.id
 ingress {
   description = "HTTP"
   from_port   = 80
   to_port     = 80
   protocol    = "tcp"
   cidr_blocks = ["0.0.0.0/0"]
 }
 egress {
   from_port   = 0
   to_port     = 0
   protocol    = "-1"
   cidr_blocks = ["0.0.0.0/0"]
 }
}
 
resource "aws_security_group" "ssh" {
 name        = "allow_ssh"
 description = "Allow SSH traffic"
 vpc_id      = aws_vpc.my_vpc.id
 ingress {
   description = "SSHC"
   from_port   = 22
   to_port     = 22
   protocol    = "tcp"
   cidr_blocks = ["0.0.0.0/0"]
 }
 egress {
   from_port   = 0
   to_port     = 0
   protocol    = "-1"
   cidr_blocks = ["0.0.0.0/0"]
 }
}
