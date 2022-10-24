module "change" {
  source = "github.com/s3d-club/terraform-external-name?ref=0.1.9-s3d-1001"

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
