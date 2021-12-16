resource "azurerm_virtual_network" "mixed_cni" {
  name                = "${local.base_name}-vnet"
  location            = data.azurerm_resource_group.mixed_cni.location
  resource_group_name = data.azurerm_resource_group.mixed_cni.name
  address_space       = [ var.vnet_address_space ]
}

resource "azurerm_subnet" "mixed_cni_snet1" {
  name                 = "${local.base_name}-subnet1"
  resource_group_name  = data.azurerm_resource_group.mixed_cni.name
  virtual_network_name = azurerm_virtual_network.mixed_cni.name
  address_prefixes     = [ var.subnet_1_address_space ]
}

resource "azurerm_subnet" "mixed_cni_snet2" {
  name                 = "${local.base_name}-subnet2"
  resource_group_name  = data.azurerm_resource_group.mixed_cni.name
  virtual_network_name = azurerm_virtual_network.mixed_cni.name
  address_prefixes     = [ var.subnet_2_address_space ]
}

locals {
  subnet1_id = azurerm_subnet.mixed_cni_snet1.id
  subnet2_id = azurerm_subnet.mixed_cni_snet2.id
}