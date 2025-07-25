data "aws_subnet" "my-public_subnet" {
  tags = {
    Name = "tf_public_subnet"
  }
}

resource "aws_instance" "my_instance" {
  ami = "ami-020cba7c55df1f615"
  instance_type = "t2.micro"
  subnet_id = data.aws_subnet.my-public_subnet.id

  tags = {
    Name = "EC2-Datasource"
    ami = "linux"
  }
}

output "ec2" {
  value = {
    instance_id = aws_instance.my_instance.id
    subnet_id = aws_instance.my_instance.subnet_id
  }
}