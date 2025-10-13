resource "azurerm_bastion_host" "bastion" {
  name                = var.bastion-name
  location            = var.bastion-location
  resource_group_name = var.rg-name
  sku = "Standard"

  ip_configuration {
    name                 = "configuration"
    subnet_id            = data.azurerm_subnet.subnet-db.id
    public_ip_address_id = data.azurerm_public_ip.pip-bas.id
  }
}

