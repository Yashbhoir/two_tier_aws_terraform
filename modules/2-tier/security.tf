resource "aws_security_group" "two-tier-db-sg" {

    name = "two_tier_db_sg"
    vpc_id = aws_vpc.two-tier.id
    depends_on = [aws_security_group.two-tier-ec2-sg]

    ingress {

        
        from_port = 3306
        to_port = 3306
        protocol = "tcp"
        security_groups = [ aws_security_group.two-tier-ec2-sg.id ]
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {

        from_port = 22
        to_port = 22
        protocol = "tcp"
        security_groups = [ aws_security_group.two-tier-ec2-sg.id ]
        cidr_blocks = ["10.0.0.0/16"]
    }

    egress {

        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]

    }

    tags = {
      Name = "two_tier_db_sg"
    }


}


resource "aws_security_group" "two-tier-ec2-sg" {

    name = "two_tier_ec2_sg"
    vpc_id = aws_vpc.two-tier.id


    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]

    }

    tags = {
      Name = "two_tier_ec2_sg"
    }
  
}

resource "aws_security_group" "two-tier-lb-sg"{
    vpc_id = aws_vpc.two-tier.id
    name = "two-tier-lb-sg"

        ingress {

            from_port = 0
            to_port = 0
            cidr_blocks = ["0.0.0.0/0"]
            protocol = "-1"
        }

        egress {
            from_port = 0
            to_port = 0
            cidr_blocks = ["0.0.0.0/0"]
            protocol = "-1"

        }
    }


