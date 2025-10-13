data "azurerm_mssql_server" "server-db" {
  name                = var.server-name
  resource_group_name = var.rg-name
}
