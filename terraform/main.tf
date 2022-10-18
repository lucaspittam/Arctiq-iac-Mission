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
  cidr_block        = "172.16.10.0/24"
  availability_zone = "${data.aws_region.current.name}b"

  tags = {
    Name = "subnet-example"
  }
}

#Network Interface
resource "aws_network_interface" "interface" {
  subnet_id   = aws_subnet.my_subnet.id
  private_ips = ["172.16.10.100"]

  tags = {
    Name = "primary_network_interface"
  }
}

# EC2s
resource "aws_instance" "web1" {
  ami           = "ami-097a2df4ac947655f"
  instance_type = var.instance_type
  tags = {
    Name = "web1"
    Description = "First web server that holds _____"

  }

  network_interface {
    network_interface_id = aws_network_interface.interface.id
    device_index         = 0
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
resource "aws_security_group" "allow_http" {
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
 
resource "aws_security_group" "allow_ssh" {
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

# Output ec2 info to ansible inventory

#resource "local_file" "ansible_inventory" {
 # content = templatefile("${path.module}/ansible/inventory.tmpl",
 #   {

 #   }
 # )
 # filename = "inventory"
  
#}