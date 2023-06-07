output "public_ip" {
    value = azurerm_public_ip.psk-vmpublicip.id
  
}

output "nic_id" {
    
    value = azurerm_network_interface.nic.id
}