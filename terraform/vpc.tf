resource "aws_vpc" "mlnode" {
  cidr_block       = "10.0.0.0/16"
  enable_dns_support = "true"
  enable_dns_hostnames = "true"

  tags = {
    Name = "mlnode"
    Creator = "Pipal Academy"
    Purpose = "ML Course"    
  }
}

resource "aws_subnet" "mlnode" {
  availability_zone = "${var.aws_region}a"
  cidr_block        = "10.0.0.0/24"
  vpc_id            = aws_vpc.mlnode.id

  tags = {
    Name = "mlnode"
    Creator = "Pipal Academy"
    Purpose = "ML Course"    
  }
}

resource "aws_internet_gateway" "mlnode" {
  vpc_id = aws_vpc.mlnode.id

  tags = {
    Name = "mlnode"
    Creator = "Pipal Academy"
    Purpose = "ML Course"    
  }
}

resource "aws_route_table" "mlnode" {
  vpc_id = aws_vpc.mlnode.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.mlnode.id
  }
}

resource "aws_route_table_association" "mlnode" {
  subnet_id      = aws_subnet.mlnode.id
  route_table_id = aws_route_table.mlnode.id
}


resource "aws_security_group" "mlnode" {
  name        = "mlnode"
  description = "Security group for all nodes in the cluster"
  vpc_id      = "${aws_vpc.mlnode.id}"

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port = 22
    to_port = 22
    protocol = "tcp"
  }  

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port = 80
    to_port = 80
    protocol = "tcp"
  }  

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port = 6000
    to_port = 7000
    protocol = "tcp"
  }

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port = 8000
    to_port = 9000
    protocol = "tcp"
  }

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port = 443
    to_port = 443
    protocol = "tcp"
  }  

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    protocol = "icmp"
    from_port = 8
    to_port = 0
  }  

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "mlnode"
  }
}
