//INSTANCES SECURITY GROUP
resource "aws_security_group" "hana-doiteasy-sg" {
    name        = var.sg_instance.tag
    description = var.sg_instance.description
    vpc_id      = data.aws_vpc.hana-vpc-1.id

    ingress {
        description     = var.sg_instance.ingress_1.description
        from_port       = var.sg_instance.ingress_1.from_port
        to_port         = var.sg_instance.ingress_1.to_port
        protocol        = var.sg_instance.ingress_1.protocol
        security_groups = [aws_security_group.hana-doiteasy-lb-sg.id]
    }

    ingress {
        description         = var.sg_instance.ingress_2.description
        from_port           = var.sg_instance.ingress_2.from_port
        to_port             = var.sg_instance.ingress_2.to_port
        protocol            = var.sg_instance.ingress_2.protocol
        cidr_blocks         = var.sg_instance.ingress_2.cidr_block
        ipv6_cidr_blocks    = var.sg_instance.ingress_2.ipv6_cidr_block
    }

    egress {
        from_port           = var.sg_instance.egress.from_port
        to_port             = var.sg_instance.egress.to_port
        protocol            = var.sg_instance.egress.protocol
        cidr_blocks         = var.sg_instance.egress.cidr_block
        ipv6_cidr_blocks    = var.sg_instance.egress.ipv6_cidr_block
    }

    tags = {
        Name = var.sg_instance.tag
    }
}
//LOAD BALANCER SECURITY GROUP
resource "aws_security_group" "hana-doiteasy-lb-sg" {
    name        = var.lb_sg.tag
    description = var.lb_sg.description
    vpc_id      = data.aws_vpc.hana-vpc-1.id

    ingress {
        description      = var.lb_sg.ingress.description
        from_port        = var.lb_sg.ingress.from_port
        to_port          = var.lb_sg.ingress.to_port
        protocol         = var.lb_sg.ingress.protocol
        cidr_blocks      = var.lb_sg.ingress.cidr_block
        ipv6_cidr_blocks = var.lb_sg.ingress.ipv6_cidr_block
    }

    egress {
        from_port           = var.lb_sg.egress.from_port
        to_port             = var.lb_sg.egress.to_port
        protocol            = var.lb_sg.egress.protocol
        cidr_blocks         = var.lb_sg.egress.cidr_block
        ipv6_cidr_blocks    = var.lb_sg.egress.ipv6_cidr_block
    }

    tags = {
        Name = var.lb_sg.tag
    }
}