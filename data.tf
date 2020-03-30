/*
data "azurerm_key_vault" "keyvaultsecrets" {
  name                = "${var.keyVaultName}"
  resource_group_name = "${var.keyVaultResourceGroupName}"
}
*/

data "azurerm_subnet" "subnet" {
  name                 = "${var.subnetName}"
  virtual_network_name = "${var.vnetName}"
  resource_group_name  = "${var.vnetResourceGroupName}"
}
