data "azurerm_network_interface" "nic-db" {
  name                = var.nic-name
  resource_group_name = "rg-demo"
}

data "azurerm_lb" "lb-db" {
  name                = "demo-lb"
  resource_group_name = "rg-demo"
}

data "azurerm_lb_backend_address_pool" "pool-db" {
  name            = "BackEndAddressPool"
  loadbalancer_id = data.azurerm_lb.lb-db.id
}

