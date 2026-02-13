module "natgw" {
  source = "github.com/mlinxfeld/terraform-az-fk-natgw"

  name                = "fk-natgw"
  location            = azurerm_resource_group.foggykitchen_rg.location
  resource_group_name = azurerm_resource_group.foggykitchen_rg.name

  public_ip_name = "fk-natgw-pip"

  subnet_associations = {
    private_subnet = {
      subnet_id = module.vnet.subnet_ids["fk-subnet-private"]
    }
  }
}
