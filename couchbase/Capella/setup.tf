terraform {
  required_providers {
    couchbase-capella = {
      source = "couchbasecloud/couchbase-capella"
    }
  }
}
variable "CAPELLA_AUTH_TOKEN" {
  description = "API Secret for Couchbase Capella"
  type        = string
  sensitive   = true
}

# Configure the Couchbase Capella Provider 
provider "couchbase-capella" {
  authentication_token = var.CAPELLA_AUTH_TOKEN
}

resource "couchbase-capella_project" "project" {
  organization_id = "a1ee45af-4265-4aa3-97cb-c10678291f4a"
  name            = "free"
}
