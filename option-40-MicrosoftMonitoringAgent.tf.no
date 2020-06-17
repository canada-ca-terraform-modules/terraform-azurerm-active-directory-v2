/*
Example:

monitoringAgent = {
  log_analytics_workspace_name                = "somename"
  log_analytics_workspace_resource_group_name = "someRGName"
}

*/

variable "monitoringAgent" {
  description = "Should the VM be monitored"
  default     = null
}

resource "azurerm_virtual_machine_extension" "MicrosoftMonitoringAgentDC1" {

  count                      = var.monitoringAgent == null ? 0 : 1
  name                       = "MicrosoftMonitoringAgentDC1"
  depends_on                 = [azurerm_virtual_machine_extension.DAAgentForWindowsDC1]
  virtual_machine_id         = azurerm_virtual_machine.dc1.id
  publisher                  = "Microsoft.EnterpriseCloud.Monitoring"
  type                       = "MicrosoftMonitoringAgent"
  type_handler_version       = "1.0"
  auto_upgrade_minor_version = true

  settings = <<SETTINGS
        {  
          "workspaceId": "${var.monitoringAgent.workspace_id}"
        }
  SETTINGS

  protected_settings = <<PROTECTED_SETTINGS
        {
          "workspaceKey": "${var.monitoringAgent.primary_shared_key}"
        }
  PROTECTED_SETTINGS
}

resource "azurerm_virtual_machine_extension" "MicrosoftMonitoringAgentDC2" {

  count                      = var.monitoringAgent == null ? 0 : 1
  name                       = "MicrosoftMonitoringAgentDC2"
  depends_on                 = [azurerm_virtual_machine_extension.DAAgentForWindowsDC2]
  virtual_machine_id         = azurerm_virtual_machine.dc2.id
  publisher                  = "Microsoft.EnterpriseCloud.Monitoring"
  type                       = "MicrosoftMonitoringAgent"
  type_handler_version       = "1.0"
  auto_upgrade_minor_version = true

  settings = <<SETTINGS
        {  
          "workspaceId": "${var.monitoringAgent.workspace_id}"
        }
  SETTINGS

  protected_settings = <<PROTECTED_SETTINGS
        {
          "workspaceKey": "${var.monitoringAgent.primary_shared_key}"
        }
  PROTECTED_SETTINGS
}
