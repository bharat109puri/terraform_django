resource "aws_launch_configuration" "django_lc" {
  name_prefix          = "${var.name_prefix}-django-lc-"
  image_id             = "${var.django_ami_id != "" ?  var.django_ami_id : data.aws_ami.django_ami_id.id}"
  instance_type        = "${var.django_instance_type}"
  iam_instance_profile = "${aws_iam_instance_profile.django_instance_profile.name}"
  key_name             = "${var.django_key_name}"
  security_groups      = ["${aws_security_group.django_asg_sg.id}"]
  user_data            = "${data.template_cloudinit_config.config.rendered}"
  root_block_device {
    volume_size = "${var.django_root_volume_size}"
    volume_type = "${var.django_root_volume_type}"
  }

  lifecycle {
    create_before_destroy = true
  }
}
