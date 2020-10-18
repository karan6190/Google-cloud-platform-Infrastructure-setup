# Terraform-gcp-environment-setup

![Terraform_CI](https://github.com/karan6190/terraform-gcp-environment-setup/workflows/Terraform_CI/badge.svg?branch=master)

Terraform module which creates Environment components like network, subnetwork, route etc.

These types of resources are supported:

* [Network](https://www.terraform.io/docs/providers/google/r/compute_network.html)
* [Subnetwork](https://www.terraform.io/docs/providers/google/r/compute_subnetwork.html)
* [Route](https://www.terraform.io/docs/providers/google/r/compute_route.html)
* [Router_NAT](https://www.terraform.io/docs/providers/google/r/compute_router_nat.html)
* [Firewall](https://www.terraform.io/docs/providers/google/r/compute_firewall.html)
* [Bastion Host](https://www.terraform.io/docs/providers/google/r/compute_instance.html)

## Network
By default this modules creates the **Network** with **one public subnetwork** and **one private subnetwork** with **NAT gateway on Private subnetwork**.
**Default Internet Gateway** is associated with public Subnets.

## Sample code for using network module

```hcl

module "vpc" {
  source = "./modules/env" 
  ENV                   = "${var.ENV}"              #Environment Type like qa, dev | default is qa
  VPC_NAME              = "${var.VPC_NAME}"         #Network Name  | default is "custom-vpc"
  REGION                = "${var.REGION}"           #GCP Region | default is us-east1
  PUB1_CIDR_BLOCK       = "${var.PUB1_CIDR_BLOCK}"  #CIDR Block Range | default is 10.53.17.0/24
  PRI1_CIDR_BLOCK       = "${var.PRI1_CIDR_BLOCK}"  #CIDR Block Range | default is 10.53.16.0/24
}
```

## Examples

* [DEV Environment](https://github.com/karan6190/terraform-gcp-environment-setup/tree/master/examples/Environment-dev)
* [QA Environment](https://github.com/karan6190/terraform-gcp-environment-setup/tree/master/examples/Environment-qa)

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| ENV | Infrastructure Environment Type | String | qa | yes |
| VPC_NAME | Network Name | String | custom-vpc | yes |
| REGION | GCP REGION code | String | us-east1 | yes |
| PROJECT_NAME | GCP Project Name | String | " " | yes |

## Outputs

| Name | Description |
|------|-------------|
| vpc_uri | Created Network URI |

## Authors

Module is maintained by [Karan Sharma](https://github.com/karan6190)
