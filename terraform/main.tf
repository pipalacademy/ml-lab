
data "aws_ami" "mlnode" {
  most_recent = true

  filter {
    name   = "name"
    values = ["mlnode-*"]
  }

  owners = ["self"]
}

resource "aws_instance" "mlnode" {
  ami           = data.aws_ami.mlnode.id
  instance_type = var.instance_type
  subnet_id = aws_subnet.mlnode.id
  security_groups = [aws_security_group.mlnode.id]
  associate_public_ip_address = true

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

