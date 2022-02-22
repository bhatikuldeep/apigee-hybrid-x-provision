# Apigee Hybrid - Control Plane Provisioning

Apigee Hybrid is a platform for developing and managing API proxies that features a hybrid deployment model.

This repository supports provisioning Apigee Hybrid - Control Plane (CONFIGURE GOOGLE CLOUD AND UI) via Terraform scripts.

## Versions

Apigee Hybrid - Version 1.6

## Pre-requisites

1. Apigee Org / environment details
2. Terraform - [https://www.terraform.io/downloads]
3. Gcloud client sdk - [https://cloud.google.com/sdk/docs/install]
4. GCP Service account : Create a service account and key with the [`roles/serviceusage.serviceUsageAdmin`] or [`roles/owner`] as described [here](https://registry.terraform.io/modules/terraform-google-modules/project-factory/google/latest/submodules/project_services#prerequisites), download the key file and set it as described for e.g. - [terraform/environments/nonprod/main.tf#L12](terraform/environments/nonprod/main.tf#L12) ;

> DO not check-in the service account file(s) to the repo.

For more information - [https://cloud.google.com/apigee/docs/hybrid/v1.6/big-picture]

## Usage

1. Find these scripts under [`/terraform`](terraform) directory.
2. Check the service account file name and location for non-prod and prod
3. Update and validate the [`terraform.tfvars`](terraform/environments/nonprod/terraform.tfvars) file and set the `analytics_region`, `apigee_environments`, `apigee_envgroups`, `environments` and `hostnames`.
4. Optional - Enable / Disable the APIs depending on your installation requirements - [terraform/environments/nonprod/main.tf#L20](terraform/environments/nonprod/main.tf#L20)
5. Execute the below commands;
   ```sh
   terraform init
   terraform plan
   terraform apply
   ```
   For more information - https://www.googlecloudcommunity.com/gc/Apigee/Apigee-X-Organization-Provisioning-with-Google-Terraform-Modules/m-p/166411

## Credit

Thanks to Daniel Strebel for the original post - [here](https://www.googlecloudcommunity.com/gc/Apigee/Apigee-X-Organization-Provisioning-with-Google-Terraform-Modules/m-p/166411)
