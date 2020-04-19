variable "PROJECT_NAME" {
   description = "GCP Project Name"
}
variable "ENV" {
   description = "Environment Type like qa, dev, prd"
   default     = "qa"
}
variable "VPC_NAME" { 
   description = "Network Name"
   default     = "custom-vpc"
}
variable "REGION" {
   description = "GCP Region"
   default     = "us-east1" 
}

variable "PUB1_CIDR_BLOCK" {
   type = map(string)
}

variable "PRI1_CIDR_BLOCK" {
   type = map(string)
}
