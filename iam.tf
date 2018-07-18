data "aws_iam_policy_document" "django_assume_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

data "aws_iam_policy_document" "django_role_policy" {
  statement {
    actions   = ["*"]
    resources = ["*"]
  }

  statement {
    actions   = ["aws-portal:*Billing"]
    resources = ["*"]
    effect    = "Deny"
  }

}

# django Master EC2 Role
resource "aws_iam_role" "django_instance_role" {
  name               = "${var.name_prefix}-django-instance-role-${var.aws_region}"
  path               = "/"
  description        = "Master django EC2 Role"
  assume_role_policy = "${data.aws_iam_policy_document.django_assume_role_policy.json}"
}

# django Master EC2 Policy
resource "aws_iam_policy" "django_policy" {
  name        = "${var.name_prefix}-django-policy-${var.aws_region}"
  path        = "/"
  description = "Master django EC2 Policy"
  policy      = "${data.aws_iam_policy_document.django_role_policy.json}"
}

# django Master EC2 Policy Attachement
resource "aws_iam_role_policy_attachment" "django_policy_attachment" {
  role       = "${aws_iam_role.django_instance_role.name}"
  policy_arn = "${aws_iam_policy.django_policy.arn}"
}

# django Master EC2 Instance Profile
resource "aws_iam_instance_profile" "django_instance_profile" {
  name = "${var.name_prefix}-django-instance-profile-${var.aws_region}"
  role = "${aws_iam_role.django_instance_role.name}"
  path = "/"
}
