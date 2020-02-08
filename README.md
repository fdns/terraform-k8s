# terraform-k8s
![Terraform GitHub Actions](https://github.com/fdns/terraform-k8s/workflows/Terraform%20GitHub%20Actions/badge.svg)

Terraform setup for a development kubernetes cluster

This terraform repository setup:
* VPC
* SSH Access
* Security Groups
* Instace (Spot Instance Request)
* k8s.espinoza.dev automatic DNS.

The Spot Instance Request have a time limit, to prevent leaving the k8s cluster online and wasting resources
