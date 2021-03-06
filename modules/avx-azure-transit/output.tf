output "vnet" {
  description = "The created VNET with all of it's attributes"
  value       = aviatrix_vpc.default
}

output "transit_gateway" {
  description = "The Aviatrix transit gateway object with all of it's attributes"
  value       = aviatrix_transit_gateway.default
}

output "azure_vnet_name" {
  description = "Azure VNET name"
  value       = split(":", aviatrix_vpc.default.vpc_id)[0]
}

output "azure_rg" {
  description = "Azure resource group"
  value       = split(":", aviatrix_vpc.default.vpc_id)[1]
}
