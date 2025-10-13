module "resource-group" {
  source      = "../Module/azurerm_resource_group"
  rg-name     = "rg-demo"
  rg-location = "CentralIndia"
}

module "mssql-server" {
  depends_on                   = [module.resource-group]
  source                       = "../Module/azurerm_mssql_server"
  server-name                  = "infra-server"
  rg-name                      = "rg-demo"
  rg-location                  = "CentralIndia"
  administrator_login          = "server-user"
  administrator_login_password = "P@ssword001"
}

module "mssql-database" {
  depends_on    = [module.mssql-server]
  source        = "../Module/azurerm_mssql_database"
  database-name = "infra-database"
  server-name   = "infra-server"
  rg-name       = "rg-demo"
}

module "virtual-network" {
  depends_on    = [module.resource-group]
  source        = "../Module/azurerm_virtual_network"
  vnet-name     = "vnet-infra"
  vnet-location = "CentralIndia"
  rg-name       = "rg-demo"
}

module "subnet" {
  depends_on       = [module.virtual-network]
  source           = "../Module/azurerm_subnet"
  subnet-name      = "subnet-frontend"
  rg-name          = "rg-demo"
  vnet-name        = "vnet-infra"
  address_prefixes = ["10.0.1.0/24"]
}

module "bastion-subnet" {
  depends_on       = [module.virtual-network]
  source           = "../Module/azurerm_subnet"
  subnet-name      = "AzureBastionSubnet"
  rg-name          = "rg-demo"
  vnet-name        = "vnet-infra"
  address_prefixes = ["10.0.0.0/26"]
}

module "bastion-pip" {
  depends_on   = [module.resource-group]
  source       = "../Module/azurerm_public_ip"
  pip-name     = "pip-bastion"
  rg-name      = "rg-demo"
  pip-location = "CentralIndia"
}

module "lb-pip" {
  depends_on   = [module.resource-group]
  source       = "../Module/azurerm_public_ip"
  pip-name     = "pip-loadbalancer"
  rg-name      = "rg-demo"
  pip-location = "CentralIndia"
}

module "vm01" {
  depends_on     = [module.subnet]
  source         = "../Module/azurerm_virtual_machine"
  nic-name       = "nic-frontend01"
  nic-location   = "CentralIndia"
  rg-name        = "rg-demo"
  subnet-name    = "subnet-frontend"
  vnet-name      = "vnet-infra"
  vm-name        = "vm-frontend01"
  vm-location    = "CentralIndia"
  nsg-name       = "nsg-frontend01"
  nsg-location   = "CentralIndia"
  admin-username = "User001"
  admin-password = "p@ssword001"
}

module "vm02" {
  depends_on     = [module.subnet]
  source         = "../Module/azurerm_virtual_machine"
  nic-name       = "nic-frontend02"
  nic-location   = "CentralIndia"
  rg-name        = "rg-demo"
  subnet-name    = "subnet-frontend"
  vnet-name      = "vnet-infra"
  vm-name        = "vm-frontend02"
  vm-location    = "CentralIndia"
  nsg-name       = "nsg-frontend02"
  nsg-location   = "CentralIndia"
  admin-username = "User002"
  admin-password = "p@ssword002"
}

module "bastion" {
  depends_on       = [module.bastion-subnet, module.bastion-pip]
  source           = "../Module/azurerm_bastion"
  bastion-name     = "demo-bastion"
  bastion-location = "CentralIndia"
  rg-name          = "rg-demo"
  subnet-name      = "AzureBastionSubnet"
  vnet-name        = "vnet-infra"
  pip-bas          = "pip-bastion"
}

module "load-balancer" {
  depends_on = [module.resource-group, module.lb-pip]
  source     = "../Module/azurerm_loadbalancer"
  pip-name   = "pip-loadbalancer"
  rg-name    = "rg-demo"
}

module "chunnu-vm" {
  depends_on = [module.load-balancer, module.vm01]
  source     = "../Module/azurerm_lb_association"
  nic-name   = "nic-frontend01"
}

module "munnu-vm" {
  depends_on = [module.load-balancer, module.vm02]
  source     = "../Module/azurerm_lb_association"
  nic-name   = "nic-frontend02"
}
