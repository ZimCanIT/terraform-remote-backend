# =========================================================================
# sub id and storage account 
# =========================================================================
variable "subscription_id" {
  description = "Subscription to deploy resources into, declared in .tfvars"
  type        = string
}
variable "resource_group_name" {
  description = "The name of the resource group, referenced as an env. variable."
  type        = string
}
variable "deployment_location" {
  type    = string
  default = "uksouth"
}
variable "storage_account_name" {
  description = "The name of the storage account, referenced as an env. variable."
  type        = string
}
variable "container_name" {
  description = "The name of the container in the storage account, referenced as an env. variable"
  type        = string
}
variable "key" {
  description = "The name of the state store file to be created."
  type        = string
  default     = "vmdeployment.tfstate"
}
# =========================================================================
# virtual machine 
# =========================================================================
variable "vm_name" {
  type    = string
  default = "testvm"
}
variable "vm_size" {
  type    = string
  default = "Standard_F2"
}
variable "admin_username" {
  type    = string
  default = "zcitadmin"
}
variable "admin_password" {
  description = "Password for dpeloyed vm, declared in terraform.tfvars file"
  type        = string
  sensitive   = true
}
variable "os_disk_caching" {
  type    = string
  default = "ReadWrite"
}
variable "os_disk_storage_account_type" {
  type    = string
  default = "Standard_LRS"
}
variable "image_publisher" {
  type    = string
  default = "MicrosoftWindowsServer"
}
variable "image_offer" {
  type    = string
  default = "WindowsServer"
}
variable "image_sku" {
  type    = string
  default = "2022-Datacenter"
}
variable "image_version" {
  type    = string
  default = "latest"
}
# =========================================================================
# network
# =========================================================================
variable "vnet_name" {
  type    = string
  default = "vm-deployment-vnet"
}
variable "vnet_address_space" {
  type    = list(string)
  default = ["10.0.0.0/16"]
}
variable "subnet_name" {
  type    = string
  default = "internal"
}
variable "subnet_address_prefixes" {
  type    = list(string)
  default = ["10.0.2.0/24"]
}
variable "nic_name" {
  type    = string
  default = "example-nic"
}
variable "ip_configuration_name" {
  type    = string
  default = "internal"
}
variable "private_ip_allocation" {
  type    = string
  default = "Dynamic"
}
# =========================================================================