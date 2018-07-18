resource "aws_route53_record" "django" {
  zone_id = "${var.zone_id}"
  name    = "${var.django_record_name}"
  type    = "A"

  alias {
    name                   = "${aws_lb.django_alb.dns_name}"
    zone_id                = "${aws_lb.django_alb.zone_id}"
    evaluate_target_health = true
  }
}
