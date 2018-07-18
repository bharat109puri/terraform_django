output "django_alb_dns" {
  value = "${aws_lb.django_alb.dns_name}"
}

output "django_instance_arn" {
  value = "${aws_iam_instance_profile.django_instance_profile.arn}"
}

output "instance_role" {
  value = "${aws_iam_role.django_instance_role.arn}"
}
