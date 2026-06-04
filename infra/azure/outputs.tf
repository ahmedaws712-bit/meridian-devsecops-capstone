output "resource_group_name" {
  description = "Azure resource group name."
  value       = azurerm_resource_group.main.name
}

output "storage_account_name" {
  description = "Secure Azure storage account name."
  value       = azurerm_storage_account.static_assets.name
}
