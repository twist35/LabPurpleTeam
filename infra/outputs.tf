
output "bastion_ip" {
  value = aws_instance.nat.public_ip
}