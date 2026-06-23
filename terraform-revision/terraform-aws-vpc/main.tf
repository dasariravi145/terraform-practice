resource "aws_vpc" "main" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"
  enable_dns_hostnames = true

  tags = merge(
    var.common_tags,
    {
        Name = "{var.project}-{var.environment}"
    }),
    var.vpc_tags
}