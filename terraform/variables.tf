################################
###### QUICK EDIT'S HERE  ######
################################

###### CLUSTER OPTIONS  ######

# Customize the Cluster Name
variable "cluster_name" {
  description = "Cluster Name"
  default     = "elk-overpower"
}

# Customize your AWS Region
variable "aws_region" {
  description = "AWS Region for the VPC"
  default     = "us-east-1"
}

# Customize your key path
variable "aws_key_path" {
  description = "key_path"
  default     = "~/.ssh/id_rsa.pub"
}
