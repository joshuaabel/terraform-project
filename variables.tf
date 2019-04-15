variable "project" {
  default = "tf"
}

variable "location" {
  default = "centralus"
}

variable "admin_username" {
  default = "josh"
}

variable "admin_password" {
  default = "Password1234!"
}

variable "lb_count" {
  default = "2"
}

variable "web_count" {
  default = "2"
}

variable "image_publisher" {
  default     = "OpenLogic"
}

variable "image_offer" {
  default     = "CentOS"
}

variable "image_sku" {
  default     = "7.5"
}

variable "image_version" {
  default     = "latest"
}
