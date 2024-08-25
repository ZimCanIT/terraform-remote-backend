# =========================================================================
# Inbound RDP rule, and subnet association
# =========================================================================
resource "azurerm_network_security_group" "nsg" {
  name                = "AllowInboundRDP"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  security_rule {
    name                       = "allow_rdp"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "3389"
    source_address_prefix      = data.http.my_ip.response_body
    destination_address_prefix = "*"
  }
}

resource "azurerm_subnet_network_security_group_association" "snet_nsg_association" {
  subnet_id                 = azurerm_subnet.snet.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}
# =========================================================================