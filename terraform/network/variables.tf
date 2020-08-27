provider "aws" {
  # region = "${var.region}"
  region = "eu-central-1"
}

variable "region" {
  default = "eu-central-1"
  type = string
}

variable "eks-cluster-name" {
  default = "sandbox-kube"
  type    = string
}

variable "azs_count" {
  default = 2
  type = number
}

data "aws_availability_zones" "available_zones" {
  state = "available"
}

data "aws_caller_identity" "current" {}
