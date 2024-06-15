resource "aws_vpc" "two-tier" {

    cidr_block = "10.0.0.0/16"
    instance_tenancy = "default"
    tags = {
        Name = "two_tier_vpc"
    }
  
}

data "aws_availability_zones" "availability_zone" {

    state = "available"
  
}

resource "aws_subnet" "two-tier-public" {

    vpc_id = aws_vpc.two-tier.id
    cidr_block = var.cidr_block[0]
    availability_zone = var.az

}

resource "aws_subnet" "two-tier-public2" {

    vpc_id = aws_vpc.two-tier.id
    cidr_block = var.cidr_block[1]
    availability_zone = data.aws_availability_zones.availability_zone.names[1]
     

}

resource "aws_subnet" "two-tier-private" {

    vpc_id = aws_vpc.two-tier.id
    cidr_block = var.cidr_block[2]
    availability_zone = data.aws_availability_zones.availability_zone.names[2]
     

}


resource "aws_subnet" "two-tier-private2" {

    vpc_id = aws_vpc.two-tier.id
    cidr_block = var.cidr_block[3]
    availability_zone = data.aws_availability_zones.availability_zone.names[3]
     

}

resource "aws_db_subnet_group" "two-tier-db-subnet" {

    name = "two_tier_db_subnet"
    subnet_ids = [aws_subnet.two-tier-private.id,aws_subnet.two-tier-private2.id]
  
}



resource "aws_route_table" "two_tier_route" {
  
  vpc_id = aws_vpc.two-tier.id

  route  {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.two_tier_ig.id
  }

  
}

resource "aws_internet_gateway" "two_tier_ig" {

    vpc_id = aws_vpc.two-tier.id

    tags = {
      Name = "two_tier_ig"
    }
  
}

resource "aws_route_table_association" "two_tier_rts" {

    route_table_id = aws_route_table.two_tier_route.id
    subnet_id = aws_subnet.two-tier-public.id
  
}

resource "aws_route_table_association" "two_tier_rts2" {

    route_table_id = aws_route_table.two_tier_route.id
    subnet_id = aws_subnet.two-tier-public2.id
  
}











