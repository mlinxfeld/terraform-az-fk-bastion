variable "name" {
  description = "Name of the Azure Bastion resource."
  type        = string
}

variable "location" {
  description = "Azure region."
  type        = string
}

variable "resource_group_name" {
  description = "Resource group name."
  type        = string
}

variable "bastion_subnet_id" {
  description = "ID of the AzureBastionSubnet."
  type        = string
  default     = null
}

variable "subnet_id" {
  description = "Alias for bastion_subnet_id (backward-compatible)."
  type        = string
  default     = null
}

variable "create_public_ip" {
  description = "Whether to create a Public IP for Azure Bastion."
  type        = bool
  default     = true
}

variable "sku" {
  description = "Azure Bastion SKU (Standard recommended)."
  type        = string
  default     = "Standard"

  validation {
    condition     = contains(["Basic", "Standard"], var.sku)
    error_message = "sku must be Basic or Standard."
  }
}

variable "tunneling_enabled" {
  description = "Enable native client tunneling (Standard only)."
  type        = bool
  default     = true
}

variable "ip_connect_enabled" {
  description = "Enable IP connect (Standard only)."
  type        = bool
  default     = true
}

variable "tags" {
  description = "Tags to apply to resources."
  type        = map(string)
  default     = {}
}
