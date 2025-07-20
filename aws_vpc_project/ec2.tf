resource "aws_instance" "nginx_server" {
  subnet_id                   = aws_subnet.public_subnet.id
  ami                         = var.ami
  instance_type               = var.instance_type
  vpc_security_group_ids      = [aws_security_group.nginx-sg.id]
  associate_public_ip_address = true

  user_data = <<-EOF
        #!/bin/bash
        sudo apt install nginx -y
        sudo systemctl start nginx
        EOF

  tags = {
    Name = "Nginx-Server"
  }
}
