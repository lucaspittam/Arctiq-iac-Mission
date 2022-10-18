# AWS Provider
provider "aws" {
  region     = var.aws_region
}

# VPC   
resource "aws_vpc" "my_vpc" {
  cidr_block = "172.16.0.0/16"

  tags = {
    Name = "tf-example"
  }
}
#Internet Gateway

# Private Subnet
resource "aws_subnet" "my_subnet" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "172.16.10.0/24"
  availability_zone = "us-east-2"

  tags = {
    Name = "tf-example"
  }
}
# Public Subnet

#Security Group

# EC2s

resource "aws_network_interface" "foo" {
  subnet_id   = aws_subnet.my_subnet.id
  private_ips = ["172.16.10.100"]

  tags = {
    Name = "primary_network_interface"
  }
}

resource "aws_instance" "web1" {
  ami           = "ami-097a2df4ac947655f"
  instance_type = "t2.micro"

  network_interface {
    network_interface_id = aws_network_interface.web1.id
    device_index         = 0
  }

  credit_specification {
    cpu_credits = "unlimited"
  }
}

