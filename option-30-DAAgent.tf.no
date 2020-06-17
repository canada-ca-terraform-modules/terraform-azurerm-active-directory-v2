resource "azurerm_virtual_machine_extension" "DAAgentForWindowsDC1" {
  name                       = "DAAgentForWindowsDC1"
  virtual_machine_id         = azurerm_virtual_machine.dc1.id
  publisher                  = "Microsoft.Azure.Monitoring.DependencyAgent"
  type                       = "DependencyAgentWindows"
  type_handler_version       = "9.5"
  auto_upgrade_minor_version = true
  depends_on                 = [azurerm_virtual_machine_extension.createMgmtADForest, azurerm_virtual_machine_extension.addMgmtADSecondaryDC]
}

resource "azurerm_virtual_machine_extension" "DAAgentForWindowsDC2" {
  name                       = "DAAgentForWindowsDC2"
  virtual_machine_id         = azurerm_virtual_machine.dc2.id
  publisher                  = "Microsoft.Azure.Monitoring.DependencyAgent"
  type                       = "DependencyAgentWindows"
  type_handler_version       = "9.5"
  auto_upgrade_minor_version = true
  depends_on                 = [azurerm_virtual_machine_extension.createMgmtADForest, azurerm_virtual_machine_extension.addMgmtADSecondaryDC]
}