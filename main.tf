module "change" {
  source = "github.com/s3d-club/terraform-external-name?ref=v0.1.9"

  path = path.module
  tags = var.tags
}

module "upstream" {
  source = "./upstream"

  domain_name               = var.domain
  tags                      = module.change.tags
  zone_id                   = var.zone_id
  subject_alternative_names = var.subject_alternative_names
}
