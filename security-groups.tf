resource "aws_security_group" "my_public_app_sg" {
  name        = "my_public_app_sg"
  description = "Allow access to the server"
  vpc_id      = data.aws_vpc.main_vpc.id


  # INBOUND CONNECTIONS
  ingress {
    description = "allowd ssh"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }

  ingress {
    description = "Allow HTTP into the EC2"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [
      data.aws_vpc.main_vpc.cidr_block
    ]
  }

  egress {
    description = "Allow access to the world"
    from_port   = 0
    to_port     = 0
    protocol    = "-1" #TCP + UDP
    cidr_blocks = [
      data.aws_vpc.main_vpc.cidr_block
    ]
  }

  ingress {
    # Allow API server access from anywhere inside the VPC
    description = "API Server"
    from_port   = 6443
    to_port     = 6443
    protocol    = "tcp"
    cidr_blocks = [
      data.aws_vpc.main_vpc.cidr_block
    ]
  }

  ingress {
    # Allow etcd access from anywhere inside the VPC
    description = "etcd"
    from_port   = 2379
    to_port     = 2380
    protocol    = "tcp"
    cidr_blocks = [
      data.aws_vpc.main_vpc.cidr_block
    ]
  }

  ingress {
    # Allow SSH from any host that has controlplane security group
    description = "kubelet api"
    from_port   = 10250
    to_port     = 10250
    protocol    = "tcp"
    cidr_blocks = [
      data.aws_vpc.main_vpc.cidr_block
    ]
  }

  ingress {
    # Allow access to node ports from your workstation
    # and student node
    description = "Node Ports"
    from_port   = 30000
    to_port     = 32767
    protocol    = "tcp"
    cidr_blocks = [
      data.aws_vpc.main_vpc.cidr_block
    ]
  }
}

  

