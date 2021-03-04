# Project Setup
project           = "cloud"
region            = "us-east-2"
availability_zone = "us-east-2b"

# VPC
vpc_cidr   = "10.211.0.0/16"
cloud_cidr = "10.211.1.0/24"

# SSH
ssh_keys = [
  "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFDcp18HW3dbLr6Bbq0febf1aELQWciqu+5Z2a9rkHoB neecro@nixos",
  "ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEAuwsDyMEF2+JU7GQTYdik/uBb7+ROUdWF9OuasU7t8yRVmkDR/DedJRVYkhxF9TSpK63/ndW+ygaBMLb7TAMoimgxV879rBf3uueTNbhlqbp44HLELEBotJgqbYlAKqDajnHECS3ONxuRDM14CVYt2Q29Z9lDtn71zyFrA1x/9pTDasBFUGOquQW/EESrRJGkQWOrInB7q+TgR7wiqkkhSCg8Zk84J+9iMcxleCDkw/cMgzBdeDi6SgOCBzMf+CBBM98Ktn28F0VgBSiRPHTZCscRwY7CHeRpCjMliHYuFQaD56A297iEaZKsb2bCE11objLPKXD4SVXcdTwov/dcWQ== awind",
  "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIL8JZivVNZ4dyPPSYsP6xf7cwJH29M83N+DzBbaT5MD2 neecro@ubuntu-deep"
]

# instances
# amzn2-ami-hvm-2.0.20200617.0-x86_64-gp2
default_ami = "ami-016b213e65284e9c9"
spot_time   = "4h"

master_type   = "t3a.small"
worker_type   = "t3a.medium"
worker_number = 2

master_bid = 0.0114
worker_bid = 0.0114
