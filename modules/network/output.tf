## Getting VPC URI as output
output "VPC_URI" {
  value       = "${google_compute_network.vpc.self_link}"
  description = "URI of the created google VPC"
}