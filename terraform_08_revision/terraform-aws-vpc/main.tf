resource "aws_vpc" "main" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"
  enable_dns_hostnames = true

  tags = local.vpc_final_tags
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = local.gw_final_tags
}

resource "aws_subnet" "public_subnet" {
  count = length(var.public_subnets_cidrs)
  vpc_id     = aws_vpc.main.id
  cidr_block = var.public_subnets_cidrs[count.index]
  avaibility_zone = local.az_names[count.index]
  map_public_ip_on_launch = true

  tags = merge(
        local.common_tags,
        {
            Name = "${var.project}-${var.environment}-public-${local.az_names[count.index]}"
        },
        local.public_subnets_tags
    )
}


resource "aws_subnet" "private_subnet" {
  count = length(var.private_subnets_cidrs)
  vpc_id     = aws_vpc.main.id
  cidr_block = var.private_subnets_cidrs[count.index]
  avaibility_zone = local.az_names[count.index]
  

  tags = merge(
        local.common_tags,
        {
            Name = "${var.project}-${var.environment}-private-${local.az_names[count.index]}"
        },
        local.private_subnets_tags
    )
}

resource "aws_subnet" "database_subnet" {
  count = length(var.database_subnets_cidrs)
  vpc_id     = aws_vpc.main.id
  cidr_block = var.database_subnets_cidrs[count.index]
  avaibility_zone = local.az_names[count.index]
  

  tags = merge(
        local.common_tags,
        {
            Name = "${var.project}-${var.environment}-database-${local.az_names[count.index]}"
        },
        local.database_subnets_tags
    )
}


resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id
tags = merge(
         local.common_tags,
         {
              Name = "${var.project}-${var.environment}-public"
         },
         var.public_tags
    )
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id
tags = merge(
         local.common_tags,
         {
              Name = "${var.project}-${var.environment}-private"
         },
         var.private_tags
   )
}

resource "aws_route_table" "database" {
  vpc_id = aws_vpc.main.id
tags = merge(
         local.common_tags,
         {
              Name = "${var.project}-${var.environment}-private"
         },
         var.database_tags
   )
}

resource "aws_route" "public" {
  route_table_id            = aws_route_table.public.id
  destination_cidr_block    = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.gw.id
}

resource "aws_eip" "nat" {
  domain   = "vpc"

  tags = merge(
         local.common_tags,
         {
               Name = "${var.project}-${var.environment}-nat"
         },
         var.eip_tags
    )
}

resource "aws_nat_gateway" "main" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public[0].id

    tags = merge(
            local.common_tags,
            {
                Name = "${var.project}-${var.environment}"
            },
            var.nat_gateway_tags
    )
  depands_on = [aws_internet_gateway.gw]
}

resource "aws_route" "private" {
  route_table_id            = aws_route_table.private.id
  destination_cidr_block    = "0.0.0.0/0"
  nat_gateway_id =  aws_nat_gateway.main.id
}

resource "aws_route" "database" {
  route_table_id            = aws_route_table.database.id
  destination_cidr_block    = "0.0.0.0/0"
  nat_gateway_id =  aws_nat_gateway.main.id
}

resource "aws_route_table_association" "public_association" {
  count = length(var.public_subnets_cidrs)
  subnet_id      = aws_subnet.public_subnet[count.index].id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "private_association" {
  count = length(var.private_subnets_cidrs)
  subnet_id      = aws_subnet.private_subnet[count.index].id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "database_association" {
  count = length(var.database_subnets_cidrs)
  subnet_id      = aws_subnet.database_subnet[count.index].id
  route_table_id = aws_route_table.database.id
}

