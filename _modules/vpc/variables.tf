variable "vpc_name" {
  description = "The name of the VPC."
  type        = string

}

variable "region" {
  description = "The region where the VPC will be created."
  type        = string
  default     = "ap-south-1"
}

variable "name_prefix" {
  description = "The prefix to use for the VPC name."
  type        = string
}

variable "vpc_cidr_block" {
  description = "The CIDR block for the VPC."
  type        = string
}

variable "default_tags" {
  description = "A map of tags to apply to the VPC."
  type        = map(string)
}

variable "subnets" {
  type = map(list(string))
}

variable "azs" {
  default = ["ap-south-1a", "ap-south-1b", "ap-south-1c"]
}