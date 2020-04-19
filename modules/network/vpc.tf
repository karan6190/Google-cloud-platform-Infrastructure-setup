# Create VPC
resource "google_compute_network" "vpc" {
  name                    =  "${format("%s","${var.VPC_NAME}-${var.ENV}-vpc")}"
  auto_create_subnetworks = "false"
  routing_mode            = "REGIONAL" # vaild values are GLOBAL and REGIONAL
}

# Public Subnet
resource "google_compute_subnetwork" "public_subnet" {
  name          = "${var.VPC_NAME}-${var.ENV}-pub-subnet"
  ip_cidr_range = "${var.PUB1_CIDR_BLOCK[var.ENV]}"
  network       = "${google_compute_network.vpc.self_link}"
  region        = "${var.REGION}"

}

# Private Subnet
resource "google_compute_subnetwork" "private_subnet" {
  name                     = "${var.VPC_NAME}-${var.ENV}-pri-subnet"
  ip_cidr_range            = "${var.PRI1_CIDR_BLOCK[var.ENV]}"
  network                  = "${google_compute_network.vpc.self_link}"
  region                   = "${var.REGION}"
  private_ip_google_access = true

  log_config {
    aggregation_interval = "INTERVAL_10_MIN"
    flow_sampling        = 0.5
    metadata             = "INCLUDE_ALL_METADATA"
  }
}