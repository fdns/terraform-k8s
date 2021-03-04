# General
variable "project" {
  description = "Project name, used for tagging the resources"
  type        = string
}

variable "region" {
  description = "Region of the main deployment"
  type        = string
}

variable "availability_zone" {
  description = "Main availability zone of the resource"
  type        = string
}

# SSH
variable "ssh_keys" {}

# VPC
variable "vpc_cidr" {}
variable "cloud_cidr" {}

# instances
variable "default_ami" {}
variable "spot_time" {
  description = "Time the spot instances are run"
  type        = string
}

variable "master_type" {
  description = "Instance type of the master node"
  type        = string
}

variable "worker_type" {
  description = "Instance type of the slave node"
  type        = string
}

variable "master_bid" {
  description = "Maximun bid for the spot instance"
  type        = number
}

variable "worker_bid" {
  description = "Maximun bid for the spot instance"
  type        = number
}

variable "worker_number" {
  description = "Number of worker nodes to allocate"
  type        = number
}
