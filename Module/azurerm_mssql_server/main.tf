resource "azurerm_mssql_server" "server" {
  name                         = var.server-name
  resource_group_name          = var.rg-name
  location                     = var.rg-location
  version                      = "12.0"
  administrator_login          = var.administrator_login 
  administrator_login_password = var.administrator_login_password
  minimum_tls_version          = "1.2"
}

