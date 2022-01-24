module "compute" {
    source                      = "./modules/compute"
    depends_on                  = [module.network]
    vpc_name      = var.vpc_name
    subnet1_name                = var.subnet1_name
}

module "network" {
    source = "./modules/network"
    vpc_name      = var.vpc_name
    subnet1_name  = var.subnet1_name

}




