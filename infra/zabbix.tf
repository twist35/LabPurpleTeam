resource "aws_instance" "zabbix" {
  ami                         = "ami-007891ae041e0263b" #Debian 12 ARM ami-0639bd0dd196bc480
  instance_type               = "t3.medium"
  key_name                    = aws_key_pair.vm_key.key_name
  subnet_id                   = aws_subnet.private.id
  private_ip                  = "10.0.1.25" # IP privée statique 

  vpc_security_group_ids      = [aws_security_group.zabbix_sg.id]

  tags = {
    Name = "Zabbix"
  }
}

resource "aws_security_group" "zabbix_sg" {
  vpc_id = var.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "TCP"
    security_groups =  [aws_security_group.nat_sg.id]
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "TCP"
    security_groups =  [aws_security_group.nat_sg.id]
  }

  ingress {
    from_port   = 10051
    to_port     = 10051
    protocol    = "tcp"
    cidr_blocks = [data.aws_vpc.main.cidr_block]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
