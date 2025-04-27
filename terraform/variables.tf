variable "environment" {
  description = "The environment to deploy (dev/test/prod)"
  type        = string
}

variable "location" {
  description = "Azure region for the deployment"
  type        = string
  default     = "East US"
}

variable "resource_group_name" {
  description = "Name of the Azure Resource Group"
  type        = string
}
