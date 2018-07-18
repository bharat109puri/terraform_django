variable name_prefix {
  description = "Name prefix to tag different AWS resources"
}

variable django_tags {
  description = "A map of tags to add to django Related AWS resources"
  type        = "map"
}

variable django_asg_tags {
  description = "A List of tags to add to ASG EC2 instances."
  type        = "list"
}

variable django_instance_subnets_ids {
  description = "A list of  subnet IDs to launch ASG resources in."
  type        = "list"
}

variable django_alb_subnets_ids {
  description = "A list of subnet IDs for elb."
  type        = "list"
}

variable django_instance_type {
  description = "The size of EC2 instance to launch."
}

variable django_key_name {
  description = "The ssh key name that is in AWS."
}

variable django_root_volume_type {
  description = "The type of volume. Can be standard, gp2, or io1. (Default: standard)"
}

variable django_root_volume_size {
  description = "The size of the volume in gigabytes."
}

variable django_max_size {
  description = "The maximum size of the auto scale group."
}

variable django_min_size {
  description = "The minimum size of the auto scale group."
}

variable django_desired_capacity {
  description = "The number of Amazon EC2 instances that should be running in the group."
}

variable zone_id {
  description = "The ID of the hosted zone to contain django record."
}

variable django_record_name {
  description = "The name of the Route53 record."
}

variable django_user_data {
  description = "The user data to provide when launching django instance"
  default     = ""
}

variable django_alb_internal {
  description = "If True ALB will have a private IP, if false IP will be public."
}

variable ami_django_regex {
  default = "amzn-ami-hvm-*"
  description = "amazon linux ami to bootstrap django"
}

variable django_ami_id {
  default = "ami-c29515a6"
  description = "django AMI ID. Its optional, if not specified it will pick latest ami using ami_django_regex"
}

variable django_alb_listener_ssl_certificate_name {
  description = "The name of an SSL certificate for alb"
}

variable aws_region {}
variable vpc_id {}
variable vpc_cidr {}
