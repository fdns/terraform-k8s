#!/usr/bin/env bash

sudo -u ec2-user mkdir /home/ec2-user/.ssh
%{ for key in ssh_keys ~}
sudo -u ec2-user echo "${key}" >> /home/ec2-user/.ssh/authorized_keys
%{ endfor ~}
export NAMECHEAP=$(aws --region=us-east-2 ssm get-parameter --name "namecheap" --query Parameter.Value --output text)
curl "https://dynamicdns.park-your-domain.com/update?host=k8s&domain=espinoza.dev&password=$NAMECHEAP"
