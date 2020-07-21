resource "aws_spot_fleet_request" "cheap_compute" {
  iam_fleet_role                      = "arn:aws:iam::345025288683:role/aws-ec2-spot-fleet-tagging-role"
  spot_price                          = 0.0199
  allocation_strategy                 = "lowestPrice"
  target_capacity                     = 1
  valid_until                         = timeadd(timestamp(), "2h")
  terminate_instances_with_expiration = true

  launch_specification {
    availability_zone           = var.availability_zone
    ami                         = var.default_ami
    instance_type               = "c5a.large"
    subnet_id                   = var.subnet_cloud
    associate_public_ip_address = true
    vpc_security_group_ids      = ["${var.security_group}"]
    user_data                   = "${templatefile("modules/instances/init.sh", { ssh_keys = var.ssh_keys })}"
    iam_instance_profile        = "terraform_instance_cloud"

    root_block_device {
      volume_type           = "standard"
      volume_size           = 32
      delete_on_termination = true
    }

    tags = {
      project      = var.project
      protected    = "false"
      ansible-role  = "master"
    }
  }
}

resource "aws_spot_fleet_request" "cheap_compute2" {
  iam_fleet_role                      = "arn:aws:iam::345025288683:role/aws-ec2-spot-fleet-tagging-role"
  spot_price                          = 0.0199
  allocation_strategy                 = "lowestPrice"
  target_capacity                     = 1
  valid_until                         = timeadd(timestamp(), "4h")
  terminate_instances_with_expiration = true

  launch_specification {
    availability_zone           = var.availability_zone
    ami                         = var.default_ami
    instance_type               = "c5a.large"
    subnet_id                   = var.subnet_cloud
    associate_public_ip_address = true
    vpc_security_group_ids      = ["${var.security_group}"]
    user_data                   = "${templatefile("modules/instances/init.sh", { ssh_keys = var.ssh_keys })}"
    iam_instance_profile        = "terraform_instance_cloud"

    root_block_device {
      volume_type           = "standard"
      volume_size           = 32
      delete_on_termination = true
    }

    tags = {
      project      = var.project
      protected    = "false"
      ansible-role  = "worker"
    }
  }
}
