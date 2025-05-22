resource "aws_instance" "vm_lenox" {
  ami           = var.ami
  instance_type = "t3a.micro"
  key_name      = aws_key_pair.vm_key.key_name
  vpc_security_group_ids = [
    module.vm_sg.security_group_id,   # Groupe commun VM
    module.lenox_sg.security_group_id # Groupe propre a Lenox
  ]
  subnet_id                   = aws_subnet.public.id
  private_ip                  = "10.0.2.10" # IP privée statique
  associate_public_ip_address = true

  credit_specification {
    cpu_credits = "standard"
  }

  tags = {
    Name = "Lenox-VM"
  }
}