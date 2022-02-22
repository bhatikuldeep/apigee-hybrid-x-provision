//terraform.tfvars
analytics_region    = "europe-west1"
apigee_environments = ["dev", "test"]
apigee_envgroups = {
  dev-group = {
    environments = ["dev"]
    hostnames    = ["dev.example.com"]
  },
  test-group = {
    environments = ["test"]
    hostnames    = ["test.example.com"]
  }
}
