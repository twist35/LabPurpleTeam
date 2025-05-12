resource "aws_instance" "vm_lenox" {
  ami             = var.ami
  instance_type   = var.instance_type
  key_name        = aws_key_pair.vm_key.key_name
  vpc_security_group_ids = [module.lenox_sg.security_group_id]
  subnet_id              = aws_subnet.public.id  
  private_ip             = "10.0.2.10"  # IP privée statique
  associate_public_ip_address = true

  credit_specification {
    cpu_credits = "standard"
  }

  tags = {
    Name = "Lenox-VM"
  }
}

resource "aws_key_pair" "vm_key" {
  key_name   = "vm_key"
  public_key = file("mykey.pub")
}


