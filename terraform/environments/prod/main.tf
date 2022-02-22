// main.tf

/* 
*
*
* Prerequisites : Service account used to run Terraform has permissions to manage project APIs: 
* roles/serviceusage.serviceUsageAdmin or roles/owner; 
* create the service account, download as file and pass as credentials to the provider.
*/
provider "google" {
  project     = var.project_id
  credentials = file("../../../../prod-service-account.json")
}

//Ref: https://registry.terraform.io/modules/terraform-google-modules/project-factory/google/latest/submodules/project_services
module "project-factory_project_services" {
  source     = "terraform-google-modules/project-factory/google//modules/project_services"
  version    = "11.3.0"
  project_id = var.project_id
  activate_apis = [
    "apigee.googleapis.com",
    "apigeeconnect.googleapis.com",
    "cloudresourcemanager.googleapis.com",
    "pubsub.googleapis.com",
  ]
}

//Ref: https://www.googlecloudcommunity.com/gc/Apigee/Apigee-X-Organization-Provisioning-with-Google-Terraform-Modules/td-p/166411
module "apigee" {
  source              = "github.com/terraform-google-modules/cloud-foundation-fabric/modules/apigee-organization"
  project_id          = var.project_id
  analytics_region    = var.analytics_region
  runtime_type        = "HYBRID"
  apigee_environments = var.apigee_environments
  apigee_envgroups    = var.apigee_envgroups
  description         = "Production Apigee Org."
  depends_on = [
    module.project-factory_project_services
  ]
}
