/*
Example:

encryptDisks = {
  KeyVaultResourceId = azurerm_key_vault.test-keyvault.id
  KeyVaultURL        = azurerm_key_vault.test-keyvault.vault_uri
}

*/

variable "encryptDisks" {
  description = "Should the VM disks be encrypted"
  default     = null
}

resource "azurerm_virtual_machine_extension" "AzureDiskEncryptionDC1" {

  count                      = var.encryptDisks == null ? 0 : 1
  name                       = "AzureDiskEncryptionDC1"
  depends_on                 = [azurerm_virtual_machine_extension.MicrosoftMonitoringAgentDC1]
  virtual_machine_id         = azurerm_virtual_machine.dc1.id
  publisher                  = "Microsoft.Azure.Security"
  type                       = "AzureDiskEncryption"
  type_handler_version       = "2.2"
  auto_upgrade_minor_version = true

  settings = <<SETTINGS
        {  
          "EncryptionOperation": "EnableEncryption",
          "KeyVaultResourceId": "${var.encryptDisks.KeyVaultResourceId}",
          "KeyVaultURL": "${var.encryptDisks.KeyVaultURL}",
          "KeyEncryptionAlgorithm": "RSA-OAEP",
          "VolumeType": "All",
          "ResizeOSDisk": false
        }
  SETTINGS
}

resource "azurerm_virtual_machine_extension" "AzureDiskEncryptionDC2" {

  count                      = var.encryptDisks == null ? 0 : 1
  name                       = "AzureDiskEncryptionDC2"
  depends_on                 = [azurerm_virtual_machine_extension.MicrosoftMonitoringAgentDC2]
  virtual_machine_id         = azurerm_virtual_machine.dc2.id
  publisher                  = "Microsoft.Azure.Security"
  type                       = "AzureDiskEncryption"
  type_handler_version       = "2.2"
  auto_upgrade_minor_version = true

  settings = <<SETTINGS
        {  
          "EncryptionOperation": "EnableEncryption",
          "KeyVaultResourceId": "${var.encryptDisks.KeyVaultResourceId}",
          "KeyVaultURL": "${var.encryptDisks.KeyVaultURL}",
          "KeyEncryptionAlgorithm": "RSA-OAEP",
          "VolumeType": "All",
          "ResizeOSDisk": false
        }
  SETTINGS
}