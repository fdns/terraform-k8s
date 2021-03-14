resource "aws_spot_fleet_request" "master_nodes" {
  iam_fleet_role                      = "arn:aws:iam::345025288683:role/aws-ec2-spot-fleet-tagging-role"
  spot_price                          = var.master_bid
  allocation_strategy                 = "lowestPrice"
  target_capacity                     = 1
  valid_until                         = timeadd(timestamp(), var.spot_time)
  terminate_instances_with_expiration = true

  launch_specification {
    availability_zone           = var.availability_zone
    ami                         = var.default_ami
    instance_type               = var.master_type
    subnet_id                   = var.subnet_cloud
    associate_public_ip_address = true
    vpc_security_group_ids      = [var.security_group]
    user_data                   = templatefile("modules/instances/init.sh", { ssh_keys = var.ssh_keys })
    iam_instance_profile        = "terraform_instance_cloud"

    root_block_device {
      volume_type           = "standard"
      volume_size           = 16
      delete_on_termination = true
    }

    tags = {
      project      = var.project
      protected    = "false"
      ansible-role = "master"
    }
  }

  tags = {
    project = var.project
  }
}

resource "aws_spot_fleet_request" "worker_nodes" {
  count                               = var.worker_number
  iam_fleet_role                      = "arn:aws:iam::345025288683:role/aws-ec2-spot-fleet-tagging-role"
  spot_price                          = var.worker_bid
  allocation_strategy                 = "lowestPrice"
  target_capacity                     = 1
  valid_until                         = timeadd(timestamp(), var.spot_time)
  terminate_instances_with_expiration = true

  launch_specification {
    availability_zone           = var.availability_zone
    ami                         = var.default_ami
    instance_type               = var.worker_type
    subnet_id                   = var.subnet_cloud
    associate_public_ip_address = true
    vpc_security_group_ids      = [var.security_group]
    user_data                   = templatefile("modules/instances/init.sh", { ssh_keys = var.ssh_keys })
    iam_instance_profile        = "terraform_instance_cloud"

    root_block_device {
      volume_type           = "standard"
      volume_size           = 32
      delete_on_termination = true
    }

    tags = {
      project      = var.project
      protected    = "false"
      ansible-role = "worker"
    }
  }

  tags = {
    project = var.project
  }
}
