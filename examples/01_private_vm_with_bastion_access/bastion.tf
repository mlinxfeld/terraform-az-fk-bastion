module "bastion" {
  source              = "../../"
  name                = "fk-bastion"
  location            = azurerm_resource_group.foggykitchen_rg.location
  resource_group_name = azurerm_resource_group.foggykitchen_rg.name
  bastion_subnet_id = module.vnet.subnet_ids["AzureBastionSubnet"]

  tags = var.tags
}
