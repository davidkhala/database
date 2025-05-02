data "couchbase-capella_organization" "current_organization" {
  organization_id = var.organization_id
}

data "couchbase-capella_projects" "projects" {
  organization_id = var.organization_id
}
locals {
  projects = [for project in data.couchbase-capella_projects.projects.data:
    {
      id   = project.id
      name = project.name
    }
  ]
}
output "current-organization" {
  value = {
    audit : data.couchbase-capella_organization.current_organization.audit
    name : data.couchbase-capella_organization.current_organization.name
    id : data.couchbase-capella_organization.current_organization.organization_id
  }
}

output "projects" {
  value = local.projects
}

