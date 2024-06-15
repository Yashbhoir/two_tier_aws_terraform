resource "aws_lb" "two-tier-lb" {

        name = "two-tier-lb"
        security_groups = [aws_security_group.two-tier-lb-sg.id]
        subnets = [ aws_subnet.two-tier-public.id,aws_subnet.two-tier-public2.id ]
        internal = false
        load_balancer_type = "application"
  
}

resource "aws_lb_target_group" "two-tier-lb-tg" {

    name = "two-tier-lb-tg"
    port = 80
    protocol = "HTTP"
    vpc_id = aws_vpc.two-tier.id
  
}

resource "aws_lb_listener" "two-tier-lb-listen" {

    load_balancer_arn = aws_lb.two-tier-lb.id
    port = 80
    protocol = "HTTP"
    
    default_action {
        type = "forward"
        target_group_arn = aws_lb_target_group.two-tier-lb-tg.id

    }
    
}

resource aws_lb_target_group_attachment "two-tier-lb-attach"{

        target_group_arn = aws_lb_target_group.two-tier-lb-tg.arn
        port = 80
        for_each = toset(var.instance_name)
        target_id = aws_instance.two-tier-instance[each.key].id

}