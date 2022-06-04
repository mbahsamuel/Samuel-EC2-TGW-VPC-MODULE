provider "aws" {
  region    = var.region
  profile   = var.profile
}

#================ DEMO ===================================
resource "aws_security_group" "app_sg" {
  for_each    = local.vpcs
  name        = "${each.value.name}-sg"
  description = "Allow HTTP inbound traffic"
  vpc_id      = each.value.vpc_id

  ingress {
    description      = "HTTP from VPC"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "${each.value.name}-sg"
  }
}

data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn-ami-hvm-*-x86_64-gp2"]
  }
}
# filter - (Optional) One or more name/value pairs to filter off of. There are several valid keys, for a full reference, check out describe-images in the AWS CLI reference.

module "ec2" {
  for_each                    = local.vpcs
  source                      = "./ec2-module"
  name                        = each.value.name
  ami                         = "ami-0c02fb55956c7d316" #data.aws_ami.amazon_linux.id
  instance_type               = "t2.micro"
#   availability_zone           = "ap-south-1a"
  subnet_id                   = each.value.subnet_ids[0]
  key_name                    = "awesome_key"
  vpc_security_group_ids      = [aws_security_group.app_sg[each.key].id]
#   placement_group             = aws_placement_group.web.id
  associate_public_ip_address = each.value.associate_public_ip_address

  # only one of these can be enabled at a time
  hibernation = true
  # enclave_options_enabled = true

  user_data_base64 = base64encode(<<-EOT
  #!/bin/bash
  echo "hello"
  EOT
  )

#   cpu_core_count       = 2 # default 4
#   cpu_threads_per_core = 1 # default 2

  capacity_reservation_specification = {
    capacity_reservation_preference = "open"
  }

  enable_volume_tags = false
  root_block_device = [
    {
      encrypted   = true
      volume_type = "gp3"
      throughput  = 200
      volume_size = 50
      tags = {
        Name = "root-block"
      }
    },
  ]
  # This is extra disk for the instnace, comment if not required.
  ebs_block_device = [
    {
      device_name = "/dev/sdf"
      volume_type = "gp3"
      volume_size = 5
      throughput  = 200
    #   encrypted   = true
    #   kms_key_id  = ""
    }
  ]

  tags = {
    Name        = each.value.name
    Environment = "dev"
  }
}
