resource "google_compute_router" "router" {
  name    = "${var.VPC_NAME}-${var.ENV}-router"
  region  = "${google_compute_subnetwork.private_subnet.region}"
  network = "${google_compute_network.vpc.self_link}"
}

resource "google_compute_address" "address" {
  name   = "${var.VPC_NAME}-${var.ENV}-nat-ip"
  region = "${google_compute_subnetwork.private_subnet.region}"
}

resource "google_compute_router_nat" "nat_manual" {
  name   = "${var.VPC_NAME}-${var.ENV}-router-nat"
  router = "${google_compute_router.router.name}"
  region = "${google_compute_router.router.region}"

  nat_ip_allocate_option = "MANUAL_ONLY"
  nat_ips                = "${google_compute_address.address.*.self_link}"

  source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"
  subnetwork {
    name                    = "${google_compute_subnetwork.private_subnet.self_link}"
    source_ip_ranges_to_nat = ["ALL_IP_RANGES"]
  }
}

## Route
#
resource "google_compute_route" "public-route" {
  name             = "${var.VPC_NAME}-${var.ENV}-pub-network-route"
  dest_range       = "${var.PUB1_CIDR_BLOCK[var.ENV]}"
  network          = google_compute_network.vpc.name
  next_hop_gateway = "default-internet-gateway"
  priority         = 100
}

resource "google_compute_route" "private-route" {
  name             = "${var.VPC_NAME}-${var.ENV}-pri-network-route"
  dest_range       = "${var.PRI1_CIDR_BLOCK[var.ENV]}"
  network          = google_compute_network.vpc.name
  next_hop_gateway = "default-internet-gateway"
  priority         = 100
}
