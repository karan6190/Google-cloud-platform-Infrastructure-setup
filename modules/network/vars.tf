variable "ENV" {
  description = "Environment Type like qa, dev, prd"
  default     = "qa"
}
variable "VPC_NAME" { 
  description = "Network Name"
  default     = "custom-vpc"
}

variable "REGION" {
  description = "GCP REGION"
}

variable "PUB1_CIDR_BLOCK" {
  type = map(string)
}

variable "PRI1_CIDR_BLOCK" {
  type = map(string)
}
