resource "aws_instance" "vm_test_private" {
  ami                         = var.ami
  instance_type               = "t3.nano"
  key_name                    = aws_key_pair.vm_key.key_name
  vpc_security_group_ids      = [aws_security_group.private_sg.id]
  subnet_id                   = aws_subnet.private.id
  private_ip                  = "10.0.1.10" # IP privée statique

  credit_specification {
    cpu_credits = "standard"
  }

  tags = {
    Name = "test-private-VM"
  }
}

resource "aws_security_group" "private_sg" {
  name        = "private-instance-sg"
  description = "Allow ssh bastion, all egress traffic"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "TCP"
    security_groups =  [module.bastion_sg.security_group_id]
    
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "private-instance-sg"
  }
}