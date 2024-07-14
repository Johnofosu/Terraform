terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.55.0"
    }
  }
  backend "s3" {
    bucket = "yaw-tf-test-bucket"
    key    = "Terraform-state"
    region = "eu-west-2"
  }
}

provider "aws" {
  region = var.region
}

provider "aws" {
  alias  = "new"
  region = var.region1
}

resource "aws_iam_user" "kwame" {
  name = var.iam_user_name
  path = "/system/"

  tags = {
    tag-key = "var.user_tag"
  }
}

data "aws_iam_policy_document" "kk" {
  statement {
    sid = "11"

    actions = [
      	"ec2:DescribeAccountAttributes",
				"ec2:DescribeAwsNetworkPerformanceMetricSubscriptions",
				"ec2:DescribeInstances",
				"ec2:DescribeKeyPairs",
				"ec2:GetVerifiedAccessEndpointPolicy",
				"ec2:ExportClientVpnClientCertificateRevocationList"
    ]

    resources = [
      "*",
    ]
  }
}

resource "aws_iam_policy" "kk" {
  name   = var.iam_user_policy
  path   = "/"
  policy = data.aws_iam_policy_document.kk.json
}

resource "aws_iam_user_policy_attachment" "kk" {
  user       = aws_iam_user.kwame.name
  policy_arn = aws_iam_policy.kk.arn
}

resource "aws_instance" "kk" {
  ami           = var.ami_kk
  instance_type = var.instance_type    
  }

resource "aws_instance" "kk2" {
  ami           = var.ami_kk2
  provider = aws.new
  instance_type = var.instance_type
    
}

output "instance_arn_addr" {
  value = aws_instance.kk.associate_public_ip_address
}

output "instance_ip_addr" {
  value = aws_instance.kk.arn
}

output "aws_iam_user" {
  value = aws_iam_user.kwame.arn
}

resource "aws_s3_bucket" "variables-bucket" {
  bucket = "yaw-tf-test-bucket"

  tags = {
    Name        = "yaw bucket"
    Environment = "Dev"
  }
}