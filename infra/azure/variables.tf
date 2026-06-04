variable "project_name" {
  description = "Project name used for naming resources."
  type        = string
  default     = "meridiandevsecops"
}

variable "environment" {
  description = "Deployment environment."
  type        = string
  default     = "dev"
}

variable "azure_location" {
  description = "Azure region."
  type        = string
  default     = "westeurope"
}
