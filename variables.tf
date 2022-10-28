variable "domain" {
  type = string

  description = <<-EOT
    the ACM will be constructed for this domain name.
    EOT
}

variable "subject_alternative_names" {
  default = []
  type    = list(string)

  description = <<-EOT
    Domain name

    The ACM will be constructed for this domain name.
    EOT
}

variable "tags" {
  default = {}
  type    = map(string)

  description = <<-EOT
    The tags for resources

    This module will include these tags on all resources.
    EOT
}

variable "zone_id" {
  type = string

  description = <<-EOT
    **DEPRECATED** zone_id

    This will be removed in the next version!
    EOT
}
