variable "location" {
  description = "Location of the network"
  default     = "canadacentral"
}
/*
variable "keyVaultName" {
  default = "PwS3-Infra-KV-simc2atbrf"
}

variable "keyVaultResourceGroupName" {
  default = "PwS3-Infra-Keyvault-RG"
}
*/

variable "tags" {
  default = {
    "Organizations"     = "PwP0-CCC-E&O"
    "DeploymentVersion" = "2018-12-14-01"
    "Classification"    = "Unclassified"
    "Enviroment"        = "Sandbox"
    "CostCenter"        = "PwP0-EA"
    "Owner"             = "cloudteam@tpsgc-pwgsc.gc.ca"
  }
}

variable "ad_domain_name" {
  default = "mgmt.demo.gc.ca.local"
}

variable "reverse_Zone_Object" {
  default = "2.250.10"
}

variable "ad_prefix" {
  default = "adds"
}
variable "dnsServers" {
  default = ""
}
variable "subnetName" {
  default = "PwS3-Shared-PAZ-Openshift-RG"
}

variable "vnetName" {
  default = "PwS3-Infra-NetShared-VNET"
}
variable "vnetResourceGroupName" {
  default = "PwS3-Infra-NetShared-RG"
}
variable "nic_enable_ip_forwarding" {
  default = false
}
variable "nic_enable_accelerated_networking" {
  default = false
}
variable "rootDC1IPAddress" {
  default = ""
}

variable "rootDC1IPAddress_allocation" {
  default = "Static"
}
variable "rootDC2IPAddress" {
  default = ""
}

variable "rootDC2IPAddress_allocation" {
  default = "Static"
}

variable "resourceGroupName" {
  default = "PwS3-GCInterrop-Openshift"
}

variable "admin_username" {
  default = "azureadmin"
}

variable "admin_password" {
  default = ""
}

variable "vm_size" {
  default = "Standard_B2ms"
}

variable "storage_image_reference" {
  default = {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }
}

variable "storage_os_disk" {
  default = {
    caching       = "ReadWrite"
    create_option = "FromImage"
    os_type       = "Windows"
  }
}