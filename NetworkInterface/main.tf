resource  "azurerm_public_ip" "psk-vmpublicip"   { 
   name   =   var.my_ip
   location   =   var.location
   resource_group_name   =  var.resource_group_name 
   allocation_method   =   "Dynamic" 
   sku   =   "Basic" 
 } 


resource "azurerm_network_interface" "nic" {
    name                = "${var.vmname}-nic-01"
    location            = var.location
    resource_group_name = var.resource_group_name
    ip_configuration {
        name                          = "ipconfiguration1"
        subnet_id                     = var.subnet_id
        private_ip_address_allocation = "Dynamic"
        public_ip_address_id   = azurerm_public_ip.psk-vmpublicip.id 
    }
}