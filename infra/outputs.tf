
output "bastion_public_ip" {
  value = aws_instance.nat.public_ip
}