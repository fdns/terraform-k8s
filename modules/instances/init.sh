#!/usr/bin/env bash

sudo -u ec2-user mkdir -p /home/ec2-user/.ssh
%{ for key in ssh_keys ~}
sudo -u ec2-user echo "${key}" >> /home/ec2-user/.ssh/authorized_keys
%{ endfor ~}
