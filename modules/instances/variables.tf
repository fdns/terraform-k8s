variable "project" {}
variable "availability_zone" {}

variable "security_group" {
  description = "Name of the security group for the instances"
  type        = string
}

variable "subnet_cloud" {
  description = "Subnetwork used to deploy the instance"
  type        = string
}

variable "ssh_keys" {
  description = "List with all the ssh keys to be registered"
  type        = list(string)
}

variable "default_ami" {
  description = "AMI of the database instance"
  type        = string
}

variable "spot_time" {
  description = "Time the spot instances are run"
  type        = string
}
