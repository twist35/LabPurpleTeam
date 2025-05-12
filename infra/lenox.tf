resource "aws_instance" "vm_lenox" {
  ami             = var.ami
  instance_type   = var.instance_type
  key_name        = aws_key_pair.vm_key.key_name


  credit_specification {
    cpu_credits = "standard"
  }

  tags = {
    Name = "Lenox-VM"
  }
}

resource "aws_key_pair" "vm_key" {
  key_name   = "vm_key"
  public_key = file("~/.ssh/id_ed25519.pub")
}



