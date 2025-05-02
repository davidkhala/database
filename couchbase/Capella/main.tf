terraform {
  required_providers {
    couchbase-capella = {
      source = "couchbasecloud/couchbase-capella"
    }
  }
}
variable "CAPELLA_AUTH_TOKEN" {
  description = "API Key Secret"
  type        = string
  sensitive   = true
}
variable "organization_id" {
  description = "Capella Organization ID"
  default     = "a1ee45af-4265-4aa3-97cb-c10678291f4a"
}

# Configure the Couchbase Capella Provider 
provider "couchbase-capella" {
  authentication_token = var.CAPELLA_AUTH_TOKEN
}

