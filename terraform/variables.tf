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

variable "aws_ami_base" {
  description = "AMI base"
  default = "ami-0a313d6098716f372"
}

variable "ip_whitelist" {
  type        = "list"
  description = "whitelist for kibana"
  default     = ["0.0.0.0/0"]
}

variable "nodes_instance_type" {
  description = "Instance type for nodes"
  default     = "c4.large"
}

variable "kibana_instance_type" {
  description = "Instance type for kibana"
  default     = "c4.large"
}

variable "apm_instance_type" {
  description = "Instance type for apm"
  default     = "t3.medium"
}

variable "logstash_instance_type" {
  description = "Instance type for logstash"
  default     = "t3.medium"
}