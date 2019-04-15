resource "azurerm_resource_group" "main" {
  name     = "${var.project}-resources"
  location = "${var.location}"
}

resource "azurerm_virtual_network" "main" {
  name                = "${var.project}-network"
  address_space       = ["192.168.0.0/16"]
  location            = "${azurerm_resource_group.main.location}"
  resource_group_name = "${azurerm_resource_group.main.name}"
  }

resource "azurerm_subnet" "internal" {
  name                  = "internal"
  resource_group_name   = "${azurerm_resource_group.main.name}"
  virtual_network_name  = "${azurerm_virtual_network.main.name}"
  address_prefix        = "192.168.2.0/24"
}
