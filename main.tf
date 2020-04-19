## This Template creates the Infrastructure components like network, Subnetworks
## route, Nat gateway.

provider "google" {
  project     = var.PROJECT_NAME
  region      = "${var.REGION}" 
}

module "vpc" {
  source = "./modules/network" 
  ENV                   = "${var.ENV}"
  VPC_NAME              = "${var.VPC_NAME}"
  REGION                = "${var.REGION}"
  PUB1_CIDR_BLOCK       = "${var.PUB1_CIDR_BLOCK}"
  PRI1_CIDR_BLOCK       = "${var.PRI1_CIDR_BLOCK}"
}