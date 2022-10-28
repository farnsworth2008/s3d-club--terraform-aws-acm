module "name" {
  source = "github.com/s3d-club/terraform-external-name?ref=0.1.10-s3d-1014"

  path = path.module
  tags = var.tags
}

module "upstream" {
  source = "./upstream"

  domain_name               = var.domain
  tags                      = module.name.tags
  zone_id                   = var.zone_id
  subject_alternative_names = var.subject_alternative_names
}
