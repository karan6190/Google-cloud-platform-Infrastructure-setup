resource "google_compute_firewall" "allow-internal" {
  name    = "${var.VPC_NAME}-${var.ENV}-fw-allow-internal"
  network = "${google_compute_network.vpc.name}"
  allow {
    protocol = "icmp"
  }
  allow {
    protocol = "tcp"
    ports    = ["0-65535"]
  }

  source_ranges = [
    "${var.PUB1_CIDR_BLOCK[var.ENV]}",
    "${var.PRI1_CIDR_BLOCK[var.ENV]}"
  ]
}
resource "google_compute_firewall" "allow-http-https" {
  name    = "${var.VPC_NAME}-${var.ENV}-firewall"
  network = "${google_compute_network.vpc.name}"
  allow {
    protocol = "tcp"
    ports    = ["80", "443"]
  }
  source_ranges = ["0.0.0.0/0"]
  target_tags = ["http-https"] 
}
resource "google_compute_firewall" "allow-bastion" {
  name    = "${var.VPC_NAME}-${var.ENV}-fw-allow-bastion"
  network = "${google_compute_network.vpc.name}"
  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
  source_ranges = ["0.0.0.0/0"]
  target_tags = ["ssh"]
  }