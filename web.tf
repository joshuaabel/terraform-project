variable "project" {
  default = "tf"
}

resource "azurerm_resource_group" "main" {
  name     = "${var.project}-resources"
  location = "centralus"
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

resource "azurerm_network_interface" "main" {
  name                = "${var.project}-nic"
  location            = "${azurerm_resource_group.main.location}"
  resource_group_name = "${azurerm_resource_group.main.name}"

ip_configuration {
  name                          = "web${count.index}"
  subnet_id                     = "${azurerm_subnet.internal.id}"
  private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_virtual_machine" "main" {
  name                  = "${var.project}-web${count.index}"
  location              = "${azurerm_resource_group.main.location}"
  resource_group_name   = "${azurerm_resource_group.main.name}"
  network_interface_ids = ["${azurerm_network_interface.main.id}"]
  vm_size               = "Standard_B1s"
  count                 = 3

delete_os_disk_on_termination = true
delete_data_disks_on_termination = true

storage_image_reference {
    publisher = "OpenLogic"
    offer     = "CentOS"
    sku       = "7.5"
    version   = "latest"
  }
  storage_os_disk {
    name              = "Web${count.index}Disk1"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "web${count.index}"
    admin_username = "josh"
    admin_password = "Password1234!"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
  tags = {
    environment = "project"
  }
}
