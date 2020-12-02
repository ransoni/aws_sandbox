provider "aws" {
  region = "${var.region}"
}

variable "region" {
  default = "eu-central-1"
}

# variable "environment_name" {
#   default = "Production"
# }

# variable "environment_domain" {
#   default = "production"
# }

# variable "environment_ip_number" {
#   default = "20" # Use 20.x.x.x network
# }

# variable "vault_pass" {}

# variable "imt_instance_count" {
#   default = "1"
# }

# variable "gatekeeper_instance_count" {
#   default = "1"
# }

# variable "tracking_instance_count" {
#   default = "2"
# }

# # A Hetzner server, hence hard-coded ip
# variable "warehouse_pg_ip" {
#   default = "138.201.86.50"
# }

# # A Hetzner server, hence hard-coded ip
# variable "matching_ip" {
#   default = "138.201.205.31"
# }

# # A Hetzner server, hence hard-coded ip
# variable "science_ip" {
#   default = "195.201.82.232"
# }

# variable "wordpress_ip" {
#   default = "35.205.129.191"
# }

# # for kubernetes cluster
# variable "eks-cluster-name" {
#   default = "main-kube-cluster"
#   type    = "string"
# }

variable "eks-jenkins-cluster-name" {
  default = "sandbox-jenkins-kube"
  type    = "string"
}

data "aws_caller_identity" "current" {}
