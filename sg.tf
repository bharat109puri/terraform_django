resource "aws_security_group" "django_alb_sg" {
  name        = "${var.name_prefix}-django-alb-sg"
  description = "Security group for django ALB"
  vpc_id      = "${var.vpc_id}"

  ingress = [
    {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ["${var.vpc_cidr}"]
    },
    {
      from_port   = 443
      to_port     = 443
      protocol    = "tcp"
      cidr_blocks = ["${var.vpc_cidr}"]
    },
  ]

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "django_asg_sg" {
  name        = "${var.name_prefix}-django-asg-sg"
  description = "Security group for django ASG"
  vpc_id      = "${var.vpc_id}"

  ingress = [
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["${var.vpc_cidr}"]
    },
    {
      from_port   = 443
      to_port     = 443
      protocol    = "tcp"
      cidr_blocks = ["${var.vpc_cidr}"]
    },
    {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ["${var.vpc_cidr}"]
    },
  ]

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
}
