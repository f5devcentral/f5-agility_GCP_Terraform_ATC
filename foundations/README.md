# Foundations

This folder contains the foundational lab setup that creates VPCs for each student;
it is not intended to be executed by Agility lab administrators only.

Student count is a zero based array, so reserve 0- 5 for the lab leads/presenter and add 6 to the student count.

Within the Google project ensure that the quotas for objects are set properly for the student and lab administrator count.
VPC networks and subnetworks = (# Students + 6) * 3
IAM Service account = (# Students + 6) * 2

Verify the project quota levels in the console --> IAM & Admin --> Quotas

Lab administrators should use a Terraform cloud workspace attached to the remote github repository so that this can be a shared responsibility with one singular TF state/lock file.  This also makes the ramp up and ramp down for the event a lot easier.

For students who show up without google accounts already established before the course, identify them and place them in a breakout room with a lab assistant to add them to the listOfNames variable while the MC and presenter do their tasks.  Students should check that they can get to https://console.cloud.google.com/iam-admin/quotas/qirs?project=f5-gcs-4261-sales-agility2022 **Update for the project ID in use**

Within the TF Cloud workspace, make sure that in the settings it is configured to use the foundations directory as the Working Directory.

For information on how to use TF Cloud with Google and how to get your credentials into TF CLoud as a variable, start here - https://registry.terraform.io/providers/hashicorp/google/latest/docs/guides/getting_started 

Terraform cloud variables needed:

listOfNames HCL ["bf*****@gmail.com","jt*****@gmail.com","ph*****@gmail.com"]

project_id STRING 

admin_source_cidrs HCL ["0.0.0.0/0"]

region STRING us-east1

numberOfStudents 

GOOGLE_CREDENTIALS Sensitive - write only
