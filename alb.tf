resource "aws_lb" "django_alb" {
  name            = "${var.name_prefix}-django-alb"
  internal        = "${var.django_alb_internal}"
  security_groups = ["${aws_security_group.django_alb_sg.id}"]
  subnets         = ["${var.django_alb_subnets_ids}"]
  enable_deletion_protection = false
}

resource "aws_lb_target_group" "django_https_alb_target_group" {
  name     = "${var.name_prefix}-django-https"
  port     = 443
  protocol = "HTTPS"
  vpc_id   = "${var.vpc_id}"
  deregistration_delay  = 60
  health_check {
    path     = "/"
    protocol = "HTTPS"
    matcher  = "403"
  }
}

resource "aws_lb_target_group" "django_http_alb_target_group" {
  name     = "${var.name_prefix}-django-http"
  port     = 80
  protocol = "HTTP"
  vpc_id   = "${var.vpc_id}"
  deregistration_delay  = 60
  health_check {
    path     = "/"
    protocol = "HTTP"
    matcher  = "301"
  }
}

resource "aws_lb_listener" "django_alb_listerner" {
  load_balancer_arn = "${aws_lb.django_alb.arn}"
  port              = "80"
  protocol          = "HTTP"

  default_action {
    target_group_arn = "${aws_lb_target_group.django_http_alb_target_group.arn}"
    type             = "forward"
  }
}
