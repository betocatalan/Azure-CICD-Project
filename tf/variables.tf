
variable "client_id" {
  description = "client id"
}

variable "client_secret" {
  description = "client secret"
}

variable "subscription_id" {
  description = "subscription id"
}

variable "tenant_id" {
  description = "tenant id"
}

variable "resource_group_location" {
  type        = string
  default     = "eastus"
  description = "Location of the resource group."
}

variable "resource_group_name_prefix" {
  type        = string
  default     = "rg"
  description = "Prefix of the resource group name that's combined with a random ID so name is unique in your Azure subscription."
}

variable "heading_one" {
  type        = string
  default     = "customdata"
  description = "Bootstrap"
}

variable resource_group_name {
    type = string
    default = "ORA"
}

variable location {
    type = string
    default = "eastus"
}

variable hostname {
    type = string
    default = "my_terraform_vm"
}

variable scfile {
    type = string
    default = "yum.bash"
}