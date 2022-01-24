//------------------------------NETWORK.TF-------------------------------
//VPC
variable "vpc_cidr"{
    type =string
    default = "10.0.0.0/16"
}
variable "vpc_name"{
    type =string
    default = "hana-vpc-1"
}

//INTERNET GETWAY
variable "igw_name"{
    type =string
    default = "hana-igw"
}

//ROUT TABLE
variable "route_table_cidr"{
    type =string
    default = "0.0.0.0/0"
}
variable "igw_route_name"{
    type =string
    default = "hana-igw-route"
}

//SUBNETS:
variable "subnet1_cidr"{
    type =string
    default = "10.0.0.0/28"
}
variable "subnet2_cidr"{
    type =string
    default = "10.0.1.0/28"
}
variable "subnet1_az"{
    type =string
    default = "sa-east-1a"
}
variable "subnet2_az"{
    type =string
    default = "sa-east-1c"
}
variable "subnet1_name"{
    type =string
    default = "hana-doiteasy-subnet-1"
}
variable "subnet2_name"{
    type =string
    default = "hana-doiteasy-subnet-2"
}
variable "single_target" {
  type    = bool
  default = false
}