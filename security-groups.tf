resource "aws_security_group" "my_public_app_sg" {
  name        = "my_public_app_sg"
  description = "Allow access to the server"
  vpc_id      = data.aws_vpc.main_vpc.id


  # INBOUND CONNECTIONS

  # SSH Access
  ingress {
    description = "allow SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  // # HTTP Access
  ingress {
    description = "Allow HTTP into the EC2"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  // # HTTP Access
  // ingress {
  //   description = "Allow HTTP into the EC2"
  //   from_port   = 8080
  //   to_port     = 8080
  //   protocol    = "tcp"
  //   cidr_blocks = ["0.0.0.0/0"]
  // }

  # All Ports Access
  // ingress {
  //   description = "Allow all into the EC2"
  //   from_port   = 0
  //   to_port     = 0
  //   protocol    = "-1"
  //   cidr_blocks = ["0.0.0.0/0"]
  // }

  // # All Ports Access
  // ingress {
  //   description = "Allow All"
  //   from_port   = 0
  //   to_port     = 0
  //   protocol    = "-1"
  //   self        = true
  // }


  ingress {
    description = "Allow HTTP into the EC2"
    from_port   = 53
    to_port     = 53
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }


  ingress {
    description = "Allow HTTP into the EC2"
    from_port   = 179
    to_port     = 179
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }


  ingress {
    description = "Allow HTTP into the EC2"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow HTTP into the EC2"
    from_port   = 8472
    to_port     = 8472
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }


  ingress {
    description = "Allow HTTP into the EC2"
    from_port   = 44135
    to_port     = 44135
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }


  ingress {
    description = "Allow port 53 into the EC2"
    from_port   = 10250
    to_port     = 10250
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow port 53 into the EC2"
    from_port   = 10251
    to_port     = 10251
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }


  ingress {
    description = "Allow port 53 into the EC2"
    from_port   = 10252
    to_port     = 10252
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow port 53 into the EC2"
    from_port   = 10255
    to_port     = 10255
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow port 53 into the EC2"
    from_port   = 10256
    to_port     = 10256
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow port 53 into the EC2"
    from_port   = 10257
    to_port     = 10257
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow port 53 into the EC2"
    from_port   = 10259
    to_port     = 10259
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Kubernetes API Server
  ingress {
    description = "Kubernetes API Server"
    from_port   = 6443
    to_port     = 6443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # etcd server client API
  ingress {
    description = "etcd server client API"
    from_port   = 2379
    to_port     = 2379
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "etcd server client API"
    from_port   = 2380
    to_port     = 2380
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # NodePort Services
  ingress {
    description = "NodePort Services"
    from_port   = 30000
    to_port     = 32767
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # EGRESS
  egress {
    description = "Allow access to the world"
    from_port   = 0
    to_port     = 0
    protocol    = "-1" # TCP + UDP
    cidr_blocks = ["0.0.0.0/0"]
  }
}