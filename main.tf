

resource "azurerm_resource_group" "ranjeet-rg" {
  name     = "ranjeet-rg-route-demo"
  location = "Central India"
}

resource "azurerm_virtual_network" "vnet" {
  name                = "ranjeet-demo-vnet"
  location            = azurerm_resource_group.ranjeet-rg.location
  resource_group_name = azurerm_resource_group.ranjeet-rg.name
  address_space       = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "subnet" {
  name                 = "ranjeet-demo-subnet"
  resource_group_name  = azurerm_resource_group.ranjeet-rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_route_table" "rt" {
  name                = "ranjeet-demo-route-table"
  location            = azurerm_resource_group.ranjeet-rg.location
  resource_group_name = azurerm_resource_group.ranjeet-rg.name
}

resource "azurerm_route" "route" {
  name                = "internet-route"
  resource_group_name = azurerm_resource_group.ranjeet-rg.name
  route_table_name    = azurerm_route_table.rt.name
  address_prefix      = "0.0.0.0/0"
  next_hop_type       = "Internet"
}

resource "azurerm_subnet_route_table_association" "rt_association" {
  subnet_id      = azurerm_subnet.subnet.id
  route_table_id = azurerm_route_table.rt.id
}