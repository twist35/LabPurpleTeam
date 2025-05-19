# Terraform - Wazuh All-in-One Deployment

resource "aws_instance" "wazuh_manager" {
  ami                         = var.wazuh_ami
  instance_type               = var.wazuh_instance_type
  key_name                    = aws_key_pair.vm_key.key_name
  subnet_id                   = aws_subnet.private.id
  private_ip                  = "10.0.1.50" # IP privée statique 

  vpc_security_group_ids      = [aws_security_group.wazuh_sg.id]

  tags = {
    Name = "Wazuh-All-in-One"
  }
}

resource "aws_security_group" "wazuh_sg" {
  vpc_id = var.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "TCP"
    security_groups =  [aws_security_group.nat_sg.id]
  }

  ingress {
    from_port   = 1515
    to_port     = 1515
    protocol    = "TCP"
    cidr_blocks = [aws_subnet.public.cidr_block]
  }

  ingress {
    from_port   = 1514
    to_port     = 1514
    protocol    = "TCP"
    cidr_blocks = [aws_subnet.public.cidr_block]
  }

  ingress {
    from_port   = 5601
    to_port     = 5601
    protocol    = "TCP"
    cidr_blocks = [aws_subnet.public.cidr_block]
  }

  ingress {
    from_port   = 55000
    to_port     = 55000
    protocol    = "tcp"
    cidr_blocks = [aws_subnet.public.cidr_block]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = [aws_subnet.public.cidr_block]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "Wazuh-sg"
  }
}
