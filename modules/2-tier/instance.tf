data "aws_ami" "two-tier-ami" {

    filter {
        name = "name"
        values = ["al2023-ami-2023.4.20240513.0-kernel-6.1-x86_64"]
    }
}


resource "aws_instance" "two-tier-instance" {
    

    instance_type = var.instance_type

    ami = data.aws_ami.two-tier-ami.id

    security_groups = [aws_security_group.two-tier-ec2-sg.id]

    associate_public_ip_address = "true"

    subnet_id = aws_subnet.two-tier-public.id

    for_each = toset(var.instance_name)

    user_data = <<-EOF
#!/bin/bash
sudo yum update -y
sudo yum install nginx -y
sudo systemctl enable nginx
sudo systemctl start nginx
EOF


    tags = {
      Name = each.key
    }
    
}

