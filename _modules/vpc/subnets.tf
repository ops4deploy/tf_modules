locals {
  flattened_subnets = flatten([
    for type, cidrs in var.subnets : [
      for idx, cidr in cidrs : {
        key  = "${type}-${idx}"
        cidr = cidr
        type = type
        az   = var.azs[idx % length(var.azs)]
      }
    ]
  ])
}

resource "aws_subnet" "subnet" {
  for_each = { for subnet in local.flattened_subnets : subnet.key => subnet }

  vpc_id            = aws_vpc.main.id
  cidr_block        = each.value.cidr
  availability_zone = each.value.az

  tags = merge(
    var.default_tags,
    {
      Name = "${each.value.type}-${each.value.az}-subnet"
      Type = each.value.type
    }
  )
}
