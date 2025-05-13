resource "aws_security_group" "nat_sg" {
  name        = "nat-instance-sg"
  description = "Allow NAT traffic"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [data.aws_subnet.public.cidr_block]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "nat-instance-sg"
  }
}

resource "aws_instance" "nat" {
  ami                         = "ami-015c7728d5cb3dccd"
  instance_type               = "t3.micro"
  subnet_id                   = aws_subnet.public.id
  associate_public_ip_address = true
  source_dest_check           = false
  key_name                    = aws_key_pair.vm_key.key_name
  security_groups             = [aws_security_group.nat_sg.id]

  tags = {
    Name = "NAT-Instance"
  }
}