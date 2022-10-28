data "aws_route53_zone" "this" {
  name = join(".", slice(local.domain_split, 1, length(local.domain_split)))
}

locals {
  domain_split = split(".", var.domain)
}

module "name" {
  source = "github.com/s3d-club/terraform-external-name?ref=v0.1.14"

  path = path.module
  tags = var.tags
}

module "upstream" {
  source = "./upstream"

  domain_name               = var.domain
  subject_alternative_names = var.subject_alternative_names
  tags                      = module.name.tags
  zone_id                   = data.aws_route53_zone.this.zone_id
}
