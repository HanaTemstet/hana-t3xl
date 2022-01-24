/* //LOAD BALANCER
resource "aws_elb" "hana-doitaesy-lb" {
    name                    = var.lb_name
    subnets                 = var.single_target ? [data.aws_subnet.hana-doiteasy-subnet-1.id] : [data.aws_subnet.hana-doiteasy-subnet-1.id, data.aws_subnet.hana-doiteasy-subnet-2[0].id]
    security_groups         = [aws_security_group.hana-doiteasy-lb-sg.id]
    listener {
        instance_port       = var.lb_listener.instance_port
        instance_protocol   = var.lb_listener.instance_protocol
        lb_port             = var.lb_listener.lb_port
        lb_protocol         = var.lb_listener.lb_protocol
    }

    health_check {
        healthy_threshold   = var.health_check.healthy_threshold  
        unhealthy_threshold = var.health_check.unhealthy_threshold
        timeout             = var.health_check.timeout
        target              = var.health_check.target
        interval            = var.health_check.interval
    }

    instances                   = var.single_target ? [aws_instance.hana-app-1.id] : [aws_instance.hana-app-1.id, aws_instance.hana-app-2[0].id]
    cross_zone_load_balancing   = var.lb_cross_zone_load_balancing

    tags = {
        Name = var.lb_name
    }
} */