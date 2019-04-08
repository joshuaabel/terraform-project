# Variables file
# File to store the default value for this project

variable "resource_group" {
  description = "name of the azure resource group."
  default     = "terraform-project"
}

variable "prefix" {
  description = "prefix that will be included in the name of resources."
  default     = "tfp"
}

variable "hostname" {
  description = "virtual machine hostname. used for local hostname, DNS, and storage."
  default     = "joshuaabel-tfp"
}

variable "location" {
  description = "azure region."
  default     = "centralus"
}

variable "virtual_network_name" {
  description = "name of the virtual network."
  default     = "vnet"
}

variable "address_space" {
  description = "address space that is used by the virtual network."
  default     = "192.168.0.0/24"
}

variable "subnet_prefix" {
  description = "address prefix to use for the subnet."
  default     = "192.168.0.0/24"
}

variable "storage_account_tier" {
  description = "defines the storage tier. standard or premium."
  default     = "Standard"
}

variable "storage_replication_type" {
  description = "defines the replication type to use for the storage account."
  default     = "LRS"
}

variable "vm_size" {
  description = "size of the virtual machine."
  default     = "Standard_A0"
}

variable "image_publisher" {
  description = "publisher of the image (az vm image list)"
  default     = "OpenLogic"
}

variable "image_offer" {
  description = "name of the offer (az vm image list)"
  default     = "CentOS"
}

variable "image_sku" {
  description = "SKU to apply (az vm image list)"
  default     = "7.5"
}

variable "image_version" {
  description = "version of the image to apply (az vm image list)"
  default     = "latest"
}

variable "admin_username" {
  description = "administrator username"
  default     = "josh"
}

variable "admin_password" {
  description = "administrator password"
  default     = "Adminpassword123!"
}

variable "source_network" {
  description = "allow access from this network prefix."
  default     = "*"
}
