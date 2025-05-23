data "aws_subnet" "public" {
  id = aws_subnet.public.id
}
data "aws_subnet" "private" {
  id = aws_subnet.private.id
}
data "aws_vpc" "main" {
  id = aws_vpc.main.id
}