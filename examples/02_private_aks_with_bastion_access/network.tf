module "vnet" {
  source = "github.com/mlinxfeld/terraform-az-fk-vnet"

  name                = "fk-vnet"
  location            = azurerm_resource_group.foggykitchen_rg.location
  resource_group_name = azurerm_resource_group.foggykitchen_rg.name

  address_space = ["10.0.0.0/16"]

  subnets = {
    fk-subnet-private = {
      address_prefixes = ["10.0.1.0/24"]
    }
    AzureBastionSubnet = {
      address_prefixes = ["10.0.2.0/26"]
    }
  }
}

resource "azurerm_route_table" "fk_aks_udr" {
  name                = "fk-aks-udr"
  location            = azurerm_resource_group.foggykitchen_rg.location
  resource_group_name = azurerm_resource_group.foggykitchen_rg.name
}

resource "azurerm_subnet_route_table_association" "fk_aks_udr_assoc" {
  subnet_id      = module.vnet.subnet_ids["fk-subnet-private"]
  route_table_id = azurerm_route_table.fk_aks_udr.id
}


