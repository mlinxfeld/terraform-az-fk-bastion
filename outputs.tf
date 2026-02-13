output "bastion_id" {
  value       = azurerm_bastion_host.this.id
  description = "ID of the Azure Bastion resource."
}

output "bastion_name" {
  value       = azurerm_bastion_host.this.name
}

output "bastion_public_ip" {
  value       = var.create_public_ip ? azurerm_public_ip.bastion_pip[0].ip_address : null
}

