resource "azurerm_public_ip" "bastion_pip" {
  count               = var.create_public_ip ? 1 : 0
  name                = "${var.name}-pip"
  location            = var.location
  resource_group_name = var.resource_group_name

  allocation_method = "Static"
  sku               = "Standard"

  tags = var.tags
}

resource "azurerm_bastion_host" "this" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                 = "bastion-ip-config"
    subnet_id            = coalesce(var.bastion_subnet_id, var.subnet_id)
    public_ip_address_id = var.create_public_ip ? azurerm_public_ip.bastion_pip[0].id : null
  }

  sku = var.sku

  tunneling_enabled  = var.tunneling_enabled
  ip_connect_enabled = var.ip_connect_enabled

  tags = var.tags
}
