variable "aws_access_key" {
  description = "AWS access key where resources can be created"
  default     = ""
}

variable "aws_secret_key" {
  description = "AWS secret key where resources can be created"
  default     = ""
}

variable "region" {
  description = "Region where all resources will be installed"
  default     = ""
}

variable "key_name" {
  description = "AWS key name to access EC2 hosts"
  default     = ""
}

variable "private_key_path" {
  description = "AWS key name to access EC2 hosts"
  default     = ""
}

variable "instance_size" {
  description = "AWS key name to access EC2 hosts"
  default     = ""
}

variable "name" {
  description = "Name to be used on all the resources as identifier"
  default     = ""
}

variable "cidr" {
  description = "The CIDR block for the VPC. Default value is a valid CIDR, but not acceptable by AWS and should be overriden"
  type        = string
}

variable "public_subnets" {
  description = "A list of public subnets inside the VPC"
  type        = string
}

variable "private_subnets" {
  description = "A list of private subnets inside the VPC"
  type        = string
}

variable "project_tag" {
  description = "Name to be used on all the resources as identifier"
  type        = string
  default     = ""
}
variable "environment_tag" {
  description = "Name to be used on all the resources as identifier"
  type        = string
  default     = ""
}

variable "vol_type" {
  description = "Name to be used on all the resources as identifier"
  type        = string
  default     = ""
}

variable "vol_size" {
  description = "Name to be used on all the resources as identifier"
  type        = string
  default     = ""
}

variable "requester_tag" {
  description = "Name to be used on all the resources as identifier"
  type        = string
  default     = ""
}

variable "billing_code_tag" {
  description = "Name to be used on all the resources as identifier"
  type        = string
  default     = ""
}

variable "public_tag" {
  description = "Name to be used on all the resources as identifier"
  type        = string
  default     = ""
}

variable "private_tag" {
  description = "Name to be used on all the resources as identifier"
  type        = string
  default     = ""
}

variable "public_route_tag" {
  description = "Name to be used on all the resources as identifier"
  type        = string
  default     = ""
}

variable "private_route_tag" {
  description = "Name to be used on all the resources as identifier"
  type        = string
  default     = ""
}

variable "sec_public_tag" {
  description = "A list of private subnets inside the VPC"
  type        = string
  default     = ""
}

variable "sec_private_tag" {
  description = "A list of private subnets inside the VPC"
  type        = string
  default     = ""
}

##################################################################################
# LOCALS
##################################################################################

locals {
  common_tags = {
    BillingCode = var.billing_code_tag
    Environment = var.environment_tag
    Project     = var.project_tag
    Requester   = var.requester_tag
  }
}