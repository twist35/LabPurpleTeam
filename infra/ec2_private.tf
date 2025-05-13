resource "aws_instance" "vm_test_private" {
  ami                         = var.ami
  instance_type               = var.instance_type
  key_name                    = aws_key_pair.vm_key.key_name
  vpc_security_group_ids      = [aws_security_group.nat_sg.id]
  subnet_id                   = aws_subnet.private.id
  private_ip                  = "10.0.1.10" # IP privée statique
  associate_public_ip_address = true


  credit_specification {
    cpu_credits = "standard"
  }

  tags = {
    Name = "test-private-VM"
  }
}


