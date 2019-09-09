
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
  instance_type = var.nodes[count.index]["instance_type"]
  subnet_id = aws_subnet.mlnode.id
  vpc_security_group_ids = [aws_security_group.mlnode.id]
  associate_public_ip_address = true

  user_data = templatefile("templates/userdata.tmpl", {jupyterlab_token = var.jupyterlab_token})

  tags = {
    Name = var.nodes[count.index]["name"]
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

resource "aws_instance" "master" {
  ami           = data.aws_ami.mlnode.id
  instance_type = var.instance_type
  subnet_id = aws_subnet.mlnode.id
  vpc_security_group_ids = [aws_security_group.mlnode.id]
  associate_public_ip_address = true

  user_data = templatefile("templates/userdata.tmpl", {jupyterlab_token = var.jupyterlab_token})

  tags = {
    Name = "master"
    Creator = "Pipal Academy"
    Purpose = "ML Course"
  }
}

resource "digitalocean_record" "master" {
  domain = "pipal.in"
  name   = "master.ml"

  type = "A"
  value = aws_instance.master.public_ip
}
