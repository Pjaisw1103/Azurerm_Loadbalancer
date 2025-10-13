data "azurerm_subnet" "subnet-db" {
  name                 = var.subnet-name
  virtual_network_name = var.vnet-name
  resource_group_name  = var.rg-name
}

data "azurerm_public_ip" "pip-bas" {
  name                = var.pip-bas
  resource_group_name = var.rg-name
}

