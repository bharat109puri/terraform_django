data "aws_caller_identity" "current" {}

data "aws_ami" "django_ami_id" {
  most_recent = true

  filter {
      name   = "owner-alias"
      values = ["amazon"]
    }

  filter {
    name   = "name"
    values = ["${var.ami_django_regex}"]
  }

  filter {
    name   = "is-public"
    values = ["true"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }
}

data "template_file" "init-script" {
  template = "${file("${path.module}/scripts/init.cfg")}"
}

data "template_file" "django_userdata" {
  template = "${file("${path.module}/scripts/django_userdata.sh")}"
}

 ## Setup script to be called by the cloud-config
 data "template_cloudinit_config" "config" {
  gzip          = false
  base64_encode = false

  part {
    filename     = "django_userdata.sh"
    content_type = "text/x-shellscript"
    content      = "${data.template_file.django_userdata.rendered}"
  }

  part {
    filename     = "init.cfg"
    content_type = "text/cloud-config"
    content      = "${data.template_file.init-script.rendered}"
  }

}
