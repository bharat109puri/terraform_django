resource "aws_autoscaling_group" "django_asg" {
  name                      = "${aws_launch_configuration.django_lc.name}"
  vpc_zone_identifier       = ["${var.django_instance_subnets_ids}"]
  launch_configuration      = "${aws_launch_configuration.django_lc.name}"
  target_group_arns         = ["${aws_lb_target_group.django_http_alb_target_group.arn}","${aws_lb_target_group.django_https_alb_target_group.arn}"]
  max_size                  = "${var.django_min_size}"
  min_size                  = "${var.django_max_size}"
  desired_capacity          = "${var.django_desired_capacity}"
  wait_for_capacity_timeout = 0
  tags                      = ["${concat(list(map("key", "Name", "value", format("%s-django", var.name_prefix), "propagate_at_launch", true)),var.django_asg_tags)}"]

  lifecycle {
    create_before_destroy = true
  }
}
