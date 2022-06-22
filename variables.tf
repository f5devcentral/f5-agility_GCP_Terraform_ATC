variable "student_id" {
  type = number
  description = <<EOD
Your student id number for the lab.
EOD
}

variable "project_id" {
  type        = string
  default = "f5-gcs-4261-sales-agility2022"
  description = <<EOD
The GCP project identifier to use for Agility lab. If using outside of an Agility 
lab, change this to your current project ID.
EOD
}

variable "region" {
  type        = string
  default     = "us-east1"
  description = <<EOD
The region to deploy test resources. Default is 'us-east1'.
EOD
}

variable "bigip_image" {
  type = string
  default = "projects/f5-7626-networks-public/global/images/f5-bigip-16-1-2-2-0-0-28-payg-good-25mbps-220505073444"
  description = <<EOD
The BIG-IP base image to use in lab.  Update this to use the latest version not 
vulnerable to any of the high quarterly CVEs for a more secure/reliable lab. 
EOD
}
