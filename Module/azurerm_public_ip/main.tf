resource "azurerm_public_ip" "public-ip" {
  name                = var.pip-name
  resource_group_name = var.rg-name
  location            = var.pip-location
  allocation_method   = "Static"
  sku                 = "Standard"   
} 

