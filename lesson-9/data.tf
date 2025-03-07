data "aws_availability_zones" "working" {}
data "aws_caller_identity" "current-identity" {}
data "aws_region" "current-region" {}
data "aws_vpcs" "my_vpcs" {}

data "aws_vpc" "prod_vpc" {}


output "prod_vpc_id" {
  value = data.aws_vpc.prod_vpc.id
}

output "prod_vpc_cider" {
  value = data.aws_vpc.prod_vpc.cidr_block
}

output "data_aws_availability_zones" {
  value = data.aws_availability_zones.working.names
}

output "data_aws_caller_identity" {
  value = data.aws_caller_identity.current-identity.account_id
}

output "data_aws_region" {
  value = data.aws_region.current-region.name
}

output "aws_vpcs" {
  value = data.aws_vpcs.my_vpcs.ids
}
