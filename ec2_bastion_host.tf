resource "aws_instance" "bastion" {
  ami           = "ami-07caf09b362be10b8"
  instance_type = "t2.micro"
  user_data = file("install_mysql.sh") //Install mysql at the launch of EC2-BH
  
  subnet_id = aws_subnet.sub_public_a.id
  vpc_security_group_ids = [aws_security_group.sg_EC2_bastion_host_22.id]

  key_name = aws_key_pair.mykeypair.key_name
  associate_public_ip_address = true //It is better to attach an elastic IP

  tags = {
    Name = "bastion_host"
  }

}

resource "aws_security_group" "sg_EC2_bastion_host_22" {
  name = "sg_EC2_bastion_host_22"
  vpc_id = "${aws_vpc.my_vpc.id}"
  ingress {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# I generated key pair in my folder then I referenced it
# If you have already key pair in AWS, you can reference it and omit this resource
resource "aws_key_pair" "mykeypair" {
  key_name = "publicKey"
  public_key = file(var.public_key)
}
