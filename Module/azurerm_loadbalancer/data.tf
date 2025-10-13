data "azurerm_public_ip" "pip-lb" {
  name                = var.pip-name
  resource_group_name = var.rg-name
}

