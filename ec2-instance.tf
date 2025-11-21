# =======================
# PUBLIC INSTANCE ("pub")
# =======================
resource "aws_instance" "pub_instance" {
  ami                         = "ami-0d176f79571d18a8f"
  instance_type               = "t3.micro"
  subnet_id                   = aws_subnet.public_subnet.id
  associate_public_ip_address = true
  key_name                    = aws_key_pair.project.key_name
  vpc_security_group_ids      = [aws_security_group.mysg.id]

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install httpd -y
              systemctl start httpd
              systemctl enable httpd

              echo "My First Terraform Project" > /var/www/html/index.html
              EOF
  tags = {
    Name = "pub"
  }
}

# =======================
# PRIVATE INSTANCE ("pvt")
# =======================
resource "aws_instance" "pvt_instance" {
  ami                    = "ami-0d176f79571d18a8f"
  instance_type          = "t3.micro"
  subnet_id              = aws_subnet.private_subnet.id
  key_name               = aws_key_pair.project.key_name
  vpc_security_group_ids = [aws_security_group.mysg.id]
  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install mariadb-server -y
              systemctl start mariadb
              systemctl enable mariadb
              EOF

  # No public IP for private subnet
  associate_public_ip_address = false

  tags = {
    Name = "pvt"
  }
}
