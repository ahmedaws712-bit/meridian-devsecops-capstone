variable "project_name" {
  description = "Project name used for naming resources."
  type        = string
  default     = "meridian-devsecops"
}

variable "environment" {
  description = "Deployment environment."
  type        = string
  default     = "dev"
}

variable "aws_region" {
  description = "AWS region."
  type        = string
  default     = "eu-west-1"
}
