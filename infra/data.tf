data "aws_subnet" "public" {
  id = aws_subnet.public.id
}
data "aws_subnet" "private" {
  id = aws_subnet.private.id
}