module "vpc" {
    source = "./modules/2-tier"
    cidr_block = "${var.cidr_block}"
    az = "${var.az}" 
    instance_type = "${var.instance_type}"
    instance_name = "${var.instance_name}"
}

