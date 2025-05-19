resource "aws_instance" "vm_lenox_private" {
  ami                         = var.ami
  instance_type               = "t3a.nano"
  key_name                    = aws_key_pair.vm_key.key_name
  vpc_security_group_ids      = [
    module.lenox_private_sg.security_group_id  # Groupe propre a Lenox
  ]
  subnet_id                   = aws_subnet.private.id
  private_ip                  = "10.0.1.10" # IP privée statique
  credit_specification {
    cpu_credits = "standard"
  }

  tags = {
    Name = "Lenox-Private-VM"
  }
}




