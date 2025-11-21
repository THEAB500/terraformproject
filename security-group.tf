resource "aws_security_group" "mysg" {
  name        = "mysg"
  description = "Allow HTTP, MySQL, and SSH inbound; allow all outbound"
  vpc_id      = aws_vpc.main.id

  # Inbound Rule - HTTP (Port 80)
  ingress {
    description = "Allow HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Inbound Rule - MySQL (Port 3306)
  ingress {
    description = "Allow MySQL"
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Inbound Rule - SSH (Port 22)
  ingress {
    description = "Allow SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Outbound Rule - allow all traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"          # -1 = All protocols
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "mysg"
  }
}
