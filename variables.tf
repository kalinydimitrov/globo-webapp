variable "region" {
  type        = string
  description = "(Optional) AWS Region to deploy in. Defaults to us-east-1."
  default     = "us-east-1"
}

variable "prefix" {
  type        = string
  description = "(Required) Prefix to use for all resources in this module."
  default     = "globo"
}

variable "environment" {
  type        = string
  description = "(Required) Environment of all resources"
  default     = "dev"
}

variable "billing_code" {
  type        = string
  description = "(Required) Billing code for network resources"
  default     = "12345"
}

# Application variables
variable "ip_range" {
  type        = string
  description = "CIDR range allowed to access HTTP/SSH where applicable."
  default     = "0.0.0.0/0"
}

variable "instance_type" {
  type        = string
  description = "(Optional) EC2 Instance type to use for web app. Defaults to t3.micro."
  default     = "t3.micro"
}

# variable "api_key" {
#   type        = string
#   description = "(Required) API key for web app to talk to SaaS platform."
#   default     = "12345"
# }

variable "api_key_secret_id" {
  type        = string
  description = "(Required) Secret ID for the API key for web app to talk to SaaS platform."
}

# >>> Replacing tfe_outputs with direct inputs
variable "public_subnets" {
  type        = list(string)
  description = "(Required) List of subnet IDs for EC2 instance deployments and the ALB."
}

variable "vpc_id" {
  type        = string
  description = "(Required) VPC ID for application deployment."
}

variable "playbook_repository" {
  type        = string
  description = "(Required) URI of Ansible playbook repository."
  default     = "https://github.com/ned1313/ansible-playbook-nginx.git"
}

variable "ec2_role_name" {
  type        = string
  description = "(Required) Name of the IAM role to attach to the EC2 instance."
  default     = "globo-webapp-role"

}
