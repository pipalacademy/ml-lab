
data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-*-18.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "mlnode" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type

  tags = {
    Name = var.names[count.index]
    Creator = "Pipal Academy"
    Purpose = "ML Course"
  }

  count  = var.num_nodes  
}

resource "digitalocean_record" "mlnode" {
  domain = "pipal.in"
  name   = "${var.names[count.index]}.ml"

  type = "A"
  value = aws_instance.mlnode[count.index].public_ip

  count  = var.num_nodes  
}

