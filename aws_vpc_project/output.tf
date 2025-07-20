output "vpc_id" {
  value = aws_vpc.my_vpc.id
}
output "ec2" {
  value = aws_instance.nginx_server.id
}
output "ec2-ip" {
  value = "http://${aws_instance.nginx_server.public_ip}"
}
output "sg" {
  value = aws_security_group.nginx-sg.name
}