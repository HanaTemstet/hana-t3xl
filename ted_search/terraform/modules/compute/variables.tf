//------------------------------SECURITY_GROUP.TF-------------------------------

//INSTANCES SECURITY GROUP
variable "sg_instance" {
  type    = any
  default = {
    ingress_1 = {
        description     = "Allow port 3000 from loadbalancer security group"
        from_port       = 3000
        to_port         = 3000
        protocol        = "TCP"
    }
    ingress_2 = {
        description      = "allow ssh from jump_server_sg"
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_block       = ["0.0.0.0/0"]
        ipv6_cidr_block  = ["::/0"]
    }
    egress = {
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_block       = ["0.0.0.0/0"]
        ipv6_cidr_block  = ["::/0"]
    }
    description = "aws sg for the app instances"
    tag         = "hana-instances-sg"
  }
}
//LOAD BALANCER SECURITY GROUP
variable "lb_sg" {
  type    = any
  default = {
    ingress = {
        description     = "Allow access to the lb from any address on port 80"
        from_port       = 80
        to_port         = 80
        protocol        = "tcp"
        cidr_block      = ["0.0.0.0/0"]
        ipv6_cidr_block = ["::/0"]
    }
    egress = {
        from_port       = 0
        to_port         = 0
        protocol        = "-1"
        cidr_block      = ["0.0.0.0/0"]
        ipv6_cidr_block = ["::/0"]
    }
    description = "allow http inbound traffic to lb"
    tag         = "hana-doiteasy-lb-sg"
  }
}
//------------------------------LOADBALANCER.TF-------------------------------

//LOAD BALANCER

variable "lb_name"{
    type =string
    default = "hana-doiteasy-lb"
}
variable "instance_port"{
    type =string
    default = "3000"
}

variable "lb_listener" {
  type    = any
  default = {
    instance_port       = "80"
    instance_protocol   = "tcp"
    lb_port             = "80"
    lb_protocol         = "tcp"   
  }
}
variable "health_check" {
  type    = any
  default = {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout     = 3
    target      = "HTTP:3000/"
    interval    = 30
  }
}
variable "lb_cross_zone_load_balancing"{
    type =bool
    default = true
}
//------------------------------INSTANCES.TF-------------------------------
//INSTANCES

variable "ami_id"{
    type =string
    default = "ami-07b5a89195c6932c8"
}
variable "instance_type"{
    type =string
    default = "t2.micro"
}
variable "associate_public_ip_address"{
    type =bool
    default = true
}
variable "instace_key_name"{
    type =string
    default = "hana-sao-paulo-key"
}
variable "instance_name_1"{
    type =string
    default = "hana-app-1"
}
variable "instance_name_2"{
    type =string
    default = "hana-app-2"
}

//------------------------------MAIN.TF-------------------------------

variable "single_target" {
  type    = bool
  default = false
}
//FRROM NETWORK
variable "vpc_name"{
    type =string
    default = "hana-vpc-1"
}
variable "subnet1_name"{
    type =string
    default = "hana-doiteasy-subnet-1"
}
variable "subnet2_name"{
    type =string
    default = "hana-doiteasy-subnet-2"
}