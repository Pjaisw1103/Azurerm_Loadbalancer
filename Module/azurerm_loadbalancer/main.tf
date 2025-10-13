resource "azurerm_lb" "load-balancer" {
  name                = "demo-lb"
  location            = "CentralIndia"
  resource_group_name = var.rg-name

  frontend_ip_configuration {
    name                 = "PublicIPAddress"
    public_ip_address_id = data.azurerm_public_ip.pip-lb.id
  }
}

resource "azurerm_lb_backend_address_pool" "lb-pool" {
  loadbalancer_id = azurerm_lb.load-balancer.id
  name            = "BackEndAddressPool"
}

resource "azurerm_lb_probe" "lb-health" {
  loadbalancer_id = azurerm_lb.load-balancer.id
  name            = "ssh-running-probe"
  port            = 22
}

resource "azurerm_lb_rule" "lb-rule" {
  loadbalancer_id                = azurerm_lb.load-balancer.id
  name                           = "LBRule"
  protocol                       = "Tcp"
  frontend_port                  = 80
  backend_port                   = 80
  frontend_ip_configuration_name = "PublicIPAddress"
  backend_address_pool_ids       =  [azurerm_lb_backend_address_pool.lb-pool.id]
  probe_id                       =  azurerm_lb_probe.lb-health.id
}
