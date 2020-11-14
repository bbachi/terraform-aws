provider "aws" {
  version = "~> 3.0"
  region  = var.region
}

resource "aws_instance" "server" {
  count = 4 # create four similar EC2 instances

  ami           = var.ami_id
  instance_type = var.instance_type

  tags = {
    Name = "Server ${count.index}"
  }
}

output "server_ip_addresses" {
  value = {
    for instance in aws_instance.server:
    instance.id => instance.private_ip
  }
}