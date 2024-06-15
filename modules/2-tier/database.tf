resource "aws_db_instance" "two-tier-db" {

    allocated_storage = 5
    engine = "mysql"
    instance_class = "db.m5d.large"
    password = "Idea2021"
    username = "admin"
    db_name = "twotierdb"
    db_subnet_group_name = "two_tier_db_subnet"
    vpc_security_group_ids = [aws_security_group.two-tier-db-sg.id]
    multi_az = false
    skip_final_snapshot = true





  
}