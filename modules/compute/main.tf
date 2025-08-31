data "aws_ami" "linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_security_group" "web" {
  name        = "iac-web-sg"
  description = "allow http"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = { Name = "iac-web-sg" }
}

resource "aws_instance" "web" {
  ami                         = data.aws_ami.linux.id
  instance_type               = var.instance_type
  subnet_id                   = var.public_subnet_ids[0]
  vpc_security_group_ids      = [aws_security_group.web.id]
  associate_public_ip_address = true
  tags = { Name = "iac-web" }
  user_data = <<EOF
              #!/bin/bash
              sudo yum update -y
              sudo yum install nginx -y 
              cat << 'EOT' > /etc/nginx/conf.d/custom.conf
              server {
                  listen 80;
                  location / {
                        root   /usr/share/nginx/html;
                        index  index.html index.htm;
                        }
                      }
                      EOT
              sudo systemctl start nginx
              sudo systemctl enable nginx
              sudo systemctl status nginx
              EOF
}

