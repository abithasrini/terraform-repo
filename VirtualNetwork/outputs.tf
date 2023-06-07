/*output "resource_group_name" {
  
  value       = element(coalescelist(data.azurerm_resource_group.Pooja-psk.*.name, azurerm_resource_group.psk-rg.*.name, [""]), 0)
}

output "resource_group_id" {

  value       = element(coalescelist(data.azurerm_resource_group.Pooja-psk.*.id, azurerm_resource_group.psk-rg.*.id, [""]), 0)
}

output "resource_group_location" {
  
  value       = element(coalescelist(data.azurerm_resource_group.Pooja-psk.*.location, azurerm_resource_group.psk-rg.*.location, [""]), 0)
}*/

output "subnet_id" {
    
    value = azurerm_subnet.subnet.id
}