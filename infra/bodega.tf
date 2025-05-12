resource "aws_instance" "vm_bodega" {
  ami                         = var.ami
  instance_type               = var.instance_type
  key_name                    = aws_key_pair.vm_key.key_name
  vpc_security_group_ids      = [module.deb-vm_sg.security_group_id]
  subnet_id                   = aws_subnet.public.id
  private_ip                  = "10.0.2.20" # IP privée statique
  associate_public_ip_address = true


  credit_specification {
    cpu_credits = "standard"
  }

  tags = {
    Name = "Bodega-VM"
  }
}


