//terraform.tfvars
analytics_region    = "europe-west1"
apigee_environments = ["prod"]
apigee_envgroups = {
  prod-group = {
    environments = ["prod"]
    hostnames    = ["api.example.com"]
  }
}
