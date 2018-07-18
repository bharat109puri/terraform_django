# django Terraform Module

This folder has terraform templates to deploy django in Shared Services VPC

## Module Inputs

This module takes the following inputs:

### Terraform Variables

|     Parameter    |            Description         |  
|------------------|--------------------------------|
|     django_tags      |  Tags for django server like Environment,BusinessUnit etc.  |
|     django_asg_tags      |  Tags for django ASG like BackupDisable,Environment etc. |
|     name_prefix      | Name prefix for django |                  
|     django_image_id      |  django AMI ID, if not defined it will take from filter |
|     django_instance_type      | django instance type |
|     django_key_name      |  django key name |
|     django_root_volume_type      |  django root volume type like gp2" |
|     django_root_volume_size      |  django root volume size |
|     django_ingress_allow_cidr_blocks      | django ingress rule to allow IP's to access django |
|     django_max_size      |  django ASG max size |
|     django_min_size      |  django ASG min size |
|     django_desired_capacity      |  django ASG desired size |
|     django_user_data      |  django userdata file path example "config/user_data.tpl" |
|     django_record_name      |  django route53 hostname |
|     django_private_subnets_ids      |  django private subnet ID's |
|     aws_region      |  AWS region to deploy django |
|     zone_id      |   Route53 hostzone to add django hostname |
|     vpc_id      |   AWS VPC ID to deploy django |

## How to Deploy


1.  Create S3 Bucket for state file.
2.  Use django Apply Job or Apply Terraform Commands:

```bash
terraform init
terraform plan
terraform apply
```

## How to Destroy
 Use django Destroy Job or manually Destroy Terraform AWS Resources:

```bash
terraform destroy
```

## Output

|     Output    |            Description         |  
|------------------|--------------------------------|
|    django_elb_dns      |  django ELB  dns end point to connect to django server |

Authors
Module managed by Bharat Puri. Contact at : bhpuri@gmail.com for support and consulting

