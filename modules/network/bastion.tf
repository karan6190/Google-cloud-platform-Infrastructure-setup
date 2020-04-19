resource "google_compute_instance" "bastion" {
  name          = "${var.VPC_NAME}-${var.ENV}-bastion"
  machine_type  = "n1-standard-1"
  zone          =   "${format("%s","${var.REGION}-b")}"
  tags          = ["ssh"]
  boot_disk {
    initialize_params {
      image     =  "centos-7-v20180129"     
    }
  }
  network_interface {
    subnetwork = "${google_compute_subnetwork.public_subnet.name}"
    access_config {
      // Ephemeral IP
    }
  }
  allow_stopping_for_update = true
}