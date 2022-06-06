# Foundations

This folder contains the foundational lab setup that creates VPCs for each student;
it is not intended to be executed by Agility lab administrators only.

Student count is a zero based array, so reserve 0 for the lab leads/presenter and add 1 to the student count.

For information on how to use TF Cloud with Google and how to get your credentials into TF CLoud as a variable, start here - https://registry.terraform.io/providers/hashicorp/google/latest/docs/guides/getting_started 

Terraform cloud variables needed:

listOfNames HCL ["bf*****@gmail.com","jt*****@gmail.com","ph*****@@gmail.com"]

project_id STRING 

admin_source_cidrs HCL ["0.0.0.0/0"]

region STRING us-east1

numberOfStudents 

GOOGLE_CREDENTIALS Sensitive - write only
