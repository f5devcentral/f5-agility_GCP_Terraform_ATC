# Foundations

This folder contains the lab setup that creates VPCs and other objects for each student. It is not intended to be executed by students of the lab as elevated permissions in the GCP Project are needed.

# Prerequisites
- [Github account](https://github.com/signup?ref_cta=Sign+up&ref_loc=header+logged+out&ref_page=%2F&source=header-home)
- [Terraform Cloud account](https://app.terraform.io/public/signup/account)
- [Access to VSCODE](https://code.visualstudio.com/download)
- [Google Cloud SDK](https://cloud.google.com/sdk/docs/install)
- UDF Blueprint

## General Usage and Workflow
- **F5 Internal process** - Use ServiceNow system to request a New Project within our account that allows external users.
- Set up Terraform Cloud Workspace. More instructions on this [below](#terraform-cloud-workspace).
- Perform a run configured for all Lab staff as students.
- Once registration numbers are know, perform a run with the student number plus staff.  Verify quotas are correct, or make requests to increase as needed.  **Do not add student emails to this run.**
- Place student email addresses in the proper variable and perform a run.  When you run this, observe the reasons for the failure. Failures will happen due to quota limits OR the email address not being part of a Google account. 
  - If Quota limits hit, request increases and run again once the limits are increased.
  - Take note of all email accounts that are not Google accounts and remove them from the variable.
- **External process** - Contact any attendees via email to request an actual [Google account](#note-about-google-accounts) so that they may complete the lab.

## Terraform Cloud Workspace
As multiple Lab staff members will need to assist and run this in order to add students, it is crucial to shared your TF Cloud Org.  This ensures that there is one shared lock/state file and makes ramp up and down tasks easier.

- If you do not already have a Terraform Cloud account, create one.
- Create a Workspace in Terraform cloud that uses this remote GitHub repository.  
  - Use the [variables listed below](#terraform-cloud-variables).
  - Within the Workspace settings, set the Terraform Working Directory to /foundations/ .
  - Invite other lab staff to your Terraform Cloud Org.  **Note you can only invite 5 users into the free version.** This allows those Lab Staff members to edit and perform runs in this workspace.

## GCP tasks
- Create a new project within GCP for use with this lab for Agility.  This is needed as we cannot add external users to the F5 SE projects in the regions or in UDF.
- Verify the project quota levels in the console --> IAM & Admin --> Quotas
  - Within the Google project ensure that the quotas for objects are set properly for the student and lab administrator count.
    - VPC networks and subnetworks = (# Students + 6) * 3
    - IAM Service account = (# Students + 6) * 2

## Terraform Cloud Variables 
Within the shared workspace, create the following variables:
- Key - listOfNames 
  - Category - Terraform Variable
  - Check the HCL box
  - Value - ["account1@gmail.com","account2@customerdomain.com","account3@othercustomerdomain.com"]
  - Variable Description - `["b***b@gmail.com", "jtyl***w@gmail.com","car***rs@gmail.com"]`
- Key - project_id 
  - Category - Terraform Variable
  - Note, this value is all lower case like `f5-gcs-4261-sales-agility2022`
  - Variable Description - `The GCP project identifier to use for Agility lab.`
- Key - numberOfStudents 
  - Category - Terraform Variable
  - Value - 7
    - This is an arbitrary number, use one that reflects guidance in the steps above.
  - Variable Description - `Student count is a zero based array, so reserve 0-(# of lab staff) for the lab leads/presenter and add student count per guidance above.`
- Key - GOOGLE_CREDENTIALS 
  - Category - Environment Variable
  - Check the Sentive box.
  - Variable Description - `This is you Google Cloud Auth JSON token on one line, no linefeeds or carriage returns.`
    - For information on how to use TF Cloud with Google and how to get your credentials into TF CLoud as a variable, [start here](https://registry.terraform.io/providers/hashicorp/google/latest/docs/guides/getting_started)

### Note about Google Accounts
**IMPORTANT Procedural Note**  
For students who show up without Google Accounts already established before the course, identify them and place them in a breakout room with a lab assistant to add them to the listOfNames variable while the MC and presenter do their tasks.  Students should check that they can get to [Google cloud console](https://console.cloud.google.com/iam-admin/quotas/qirs?project=f5-gcs-4261-sales-agility2022) 
**Update the link for the project ID in use**