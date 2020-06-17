variable "location" {
  description = "Location of the network"
  default     = "canadacentral"
}

variable "tags" {
  default = {
  }
}

variable "deploy" {
  description = "Should resources in this module be deployed"
  default     = true
}

variable "monitoringAgent" {
  description = "Should the VM be monitored"
  default     = null
}

variable "dependancyAgent" {
  description = "Should the VM be include the dependancy agent"
  default     = null
}

variable "ad_domain_name" {
  default = "module.local"
}

variable "reverse_Zone_Object" {
  default = ["2.250.10"]
}

variable "ad_prefix" {
  default = "adds"
}

variable "public_ip" {
  description = "Should the VM be assigned public IP(s). True or false."
  default     = false
}

variable "dnsServers" {
  default = ["168.63.129.16"]
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
variable "rootDC1IPAddress" {}

variable "rootDC2IPAddress" {
  default = ""
}

variable "rootDC2IPAddress_allocation" {
  default = "Static"
}

variable "resourceGroup" {
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

variable "managed_disk_type" {
  default = "StandardSSD_LRS"
}

variable "priority" {
  default = "Regular"
}