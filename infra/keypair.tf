resource "aws_key_pair" "vm_key" {
  key_name   = "vm_key"
  public_key = file("mykey.pub")
}