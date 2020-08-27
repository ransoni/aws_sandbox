# Manifest used to implement AWS VPC

module "vpc" {
    source = "terraform-aws-modules/vpc/aws"
    version = "2.48.0"

    name = "kube-vpc"
    cidr = "10.10.0.0/16"

    #  azs = "${data.aws_availability_zones.available_zones.names[$azs_count.index]}"
    azs = ["eu-central-1a", "eu-central-1b", "eu-central-1c"]
    private_subnets = ["10.10.1.0/24", "10.10.2.0/24", "10.10.3.0/24"]
    public_subnets = ["10.10.11.0/24", "10.10.12.0/24", "10.10.13.0/24"]

    enable_nat_gateway = true
    single_nat_gateway = true
    one_nat_gateway_per_az = false

    enable_dns_hostnames = true
    enable_dns_support   = true

    tags = {
        Terraform = "true"
        Environment = "dev"
    }
}
