##Output of the designed environment

output "vpc_uri" {
  value       = "${module.vpc.VPC_URI}"
  description = "Designed VPC URI"
}
