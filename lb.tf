resource "azurerm_network_interface" "lb" {
  name                = "${var.project}-lb-nic${count.index}"
  location            = "${azurerm_resource_group.main.location}"
  resource_group_name = "${azurerm_resource_group.main.name}"
  count               = "${var.lb_count}"

ip_configuration {
  name                          = "lb${count.index}"
  subnet_id                     = "${azurerm_subnet.internal.id}"
  private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_virtual_machine" "lb" {
  name                  = "${var.project}-lb${count.index}"
  location              = "${azurerm_resource_group.main.location}"
  resource_group_name   = "${azurerm_resource_group.main.name}"
  network_interface_ids = ["${element(azurerm_network_interface.lb.*.id, count.index)}"]
  vm_size               = "Standard_B1s"
  count                 = "${var.lb_count}"

delete_os_disk_on_termination = true
delete_data_disks_on_termination = true

storage_image_reference {
    publisher = "${var.image_publisher}"
    offer     = "${var.image_offer}"
    sku       = "${var.image_sku}"
    version   = "${var.image_version}"
  }
  storage_os_disk {
    name              = "lb${count.index}_disk1"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "lb${count.index}"
    admin_username = "${var.admin_username}"
    admin_password = "${var.admin_password}"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
}
