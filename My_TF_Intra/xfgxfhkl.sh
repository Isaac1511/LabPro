# Create a script that runs all TF cmds.
tf init
tf plan
tf apply -auto-approve




resource "azurerm_network_interface_security_group_association" "tf_nic1_nsg_association" {
  network_interface_id      = azurerm_network_interface.tfmynic1.id
  network_security_group_id = azurerm_network_security_group.tfnsgname.id


update this block of code below, then add back to the script

# Add association for Subnet and NSG
resource "azurerm_network_interface_security_group_association" "" {
  network_interface_id = azurerm_ne
  network_security_group_id = azurerm_network_interface_security_group.tfnsgname # Add association for subnet
}