terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "psk-rg"{
name                            =var.resource_group_name
location                        =var.location
}

module "virtual-network" {
   source = "./VirtualNetwork"
    ##create_resource_group           = var.create_resource_group   
    resource_group_name             = var.resource_group_name
    location                        = var.location
    ##create_ddos_plan                = var.create_ddos_plan
    virtual_network_name            = var.virtual_network_name
    virtual_network_address_space   = var.virtual_network_address_space
    subnet_name                     = var.subnet_name
    subnet_address_prefixes         = var.subnet_address_prefixes
}
module "network-interface" {
    source = "./NetworkInterface"
    vmname              = var.vmname
    location            = var.location
    resource_group_name = var.resource_group_name
    subnet_id           = module.virtual-network.subnet_id
    my_ip                = var.my_ip
}
module "virtual-machine" {
    source = "./VirtualMachine"
    vmname                  = var.vmname
    location                = var.location
    resource_group_name     = var.resource_group_name
    network_interface_ids   = [module.network-interface.nic_id]
    my_ip                    = var.my_ip
    vm_size                 = var.vm_size
    os_disk_type            = var.os_disk_type
    admin_usename           = var.admin_usename
    admin_password          = var.admin_password
    image_publisher         = var.image_publisher
    image_offer             = var.image_offer
    image_sku               = var.image_sku
    
}

module "storage-account"{
  source = "./Storage"
  storage_account_name = var.storage_account_name
  resource_group_name = var.resource_group_name
  location = var.location
  container_name = var.container_name
}