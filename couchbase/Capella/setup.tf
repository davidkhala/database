terraform {
  required_providers {
    couchbase-capella = {
      source = "couchbasecloud/couchbase-capella"
    }
  }
}

# Configure the Couchbase Capella Provider 
provider "couchbase-capella" {
  authentication_token = var.couchbasecapella_auth_token
}
# Create the resources