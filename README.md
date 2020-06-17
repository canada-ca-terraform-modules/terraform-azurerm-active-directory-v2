# Active Directory Domain Controlers v3

## Introduction

This template will create an Active Directory forest with 1 Domain, with 2 Domain Controlers.

The template creates the following:

* Two root domain are always created.
* Choose names for the Domain, DCs, and network objects.  
* Choose the VM size.

The Domain Controllers are placed in an Availability Set to maximize uptime.

The VMs are provisioned with managed disks.  Each VM will have the AD-related management tools installed.

## Security Controls

The following security controls can be met through configuration of this template:

* TO Be Determined

## Dependancies

* [Resource Groups](https://github.com/canada-ca-azure-templates/resourcegroups/blob/master/readme.md)
* [Keyvault](https://github.com/canada-ca-azure-templates/keyvaults/blob/master/readme.md)
* [VNET-Subnet](https://github.com/canada-ca-azure-templates/vnet-subnet/blob/master/readme.md)

## Usage

```terraform
module "SRV-BYOD-adt" {
  source         = "github.com/canada-ca-terraform-modules/terraform-azurerm_linux_virtual_machine?ref=20200617.2"
  deploy                = true
  ad_prefix             = "${var.env}SRV-BYODA"
  resourceGroup         = azurerm_resource_group.SomeRGObject
  location              = azurerm_resource_group.SomeRGObject.location
  subnetName            = azurerm_subnet.Project_OZ-snet.name
  vnetName              = azurerm_subnet.Project_OZ-snet.virtual_network_name
  vnetResourceGroupName = azurerm_subnet.Project_OZ-snet.resource_group_name
  admin_username        = "azureadmin"
  admin_password        = "Canada123!"
  managed_disk_type     = "StandardSSD_LRS"
  encryptDisks = {
    KeyVaultResourceId = azurerm_key_vault.Project-kv.id
    KeyVaultURL        = azurerm_key_vault.Project-kv.vault_uri
  }
  rootDC1IPAddress    = "172.16.133.90"
  rootDC2IPAddress    = "172.16.133.91"
  ad_domain_name      = "test.gc.local"
  reverse_Zone_Object = ["0.0.10", "1.0.10"]
  monitoringAgent     = azurerm_log_analytics_workspace.Project-law
  dependancyAgent     = true
  public_ip           = false
  tags                = var.tags
}
```

## Variables Values

| Name                    | Type   | Required | Value                                                                                                                                                                                          |
| ----------------------- | ------ | -------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| location                | string | no       | Azure location for resources. Default: canadacentral                                                                                                                                           |
| name                    | string | yes      | Name of the vm                                                                                                                                                                                 |
| tags                    | object | no       | Object containing a tag values - [tags pairs](#tag-object)                                                                                                                                     |
| deploy                  | bool   | no       | Should resources in this module be deployed. This is usefull if you want to specify that a module should not be created without changing the terraform code across environments. Default: true |
| dependancyAgent         | bool   | no       | Installs the dependancy agent for service map integration. Default: false                                                                                                                      |
| monitoringAgent         | object | no       | Configure Azure monitoring on VM. Requires configured log analytics workspace. - [monitoring agent](#monitoring-agent-object)                                                                  |
| ad_domain_name          | string | yes      | Name of the desired Active Directory domain. Example: test.local                                                                                                                               |
| reverse_Zone_Object     | list   | yes      | List of reverse zones to configure. Example: ["1.0.10","2.0.10"]                                                                                                                               |
| ad_prefix               | string | yes      | Short string to set the prefix for Azure resources created by the module. Example: "SRV-BYOD"                                                                                                  |
| public_ip               | bool   | no       | Does the VM require a public IP. true or false. Default: false                                                                                                                                 |
| dnsServers              | list   | no       | List of DNS servers IP addresses as string to use for this NIC, overrides the VNet-level dns server list - [dns servers](#dns-servers-list)                                                    |
| subnetName              | string | yes      | Name of the subnet where the servers will be deployed to.                                                                                                                                      |
| vnetName                | string | yes      | Name of the vnet that contain the subnet named above.                                                                                                                                          |
| vnetResourceGroupName   | string | yes      | Name of the resourcegroup that contain the vnet named above.                                                                                                                                   |
| rootDC1IPAddress        | string | yes      | Private IP assigned to the DC1 server                                                                                                                                                          |
| rootDC2IPAddress        | string | yes      | Private IP assigned to the DC2 server                                                                                                                                                          |
| resource_group          | object | yes      | Resourcegroup that will contain the VM resources                                                                                                                                               |
| admin_username          | string | yes      | Name of the VM admin account                                                                                                                                                                   |
| admin_password          | string | yes      | Password of the VM admin account                                                                                                                                                               |
| vm_size                 | string | yes      | Specifies the desired size of the Virtual Machine. Eg: Standard_F4                                                                                                                             |
| encryptDisks            | object | no       | Object containing keyvault information for disk encryption. - [encryptDisk](#encryptDisk-object)                                                                                               |
| storage_image_reference | object | no       | Specify the storage image used to create the VM. Default is 2016-Datacenter. - [storage image](#storage-image-reference-object)                                                                |
| managed_disk_type       | string | no       | Specify the type of managed storage to use for OS and Data disk. Default: "StandardSSD_LRS"                                                                                                    |
| priority                | string | no       | Specifies what should happen when the Virtual Machine is evicted for price reasons when using a Spot instance. Possible values are: Regular and Spot. Default: Regular                         |

### encryptDisk object

Example

```
encryptDisks = {
  KeyVaultResourceId = azurerm_key_vault.test-keyvault.id
  KeyVaultURL        = azurerm_key_vault.test-keyvault.vault_uri
}
```

### Tag variable

| Name     | Type   | Required | Value      |
| -------- | ------ | -------- | ---------- |
| tagname1 | string | No       | tag1 value |
| ...      | ...    | ...      | ...        |
| tagnameX | string | No       | tagX value |

## History

| Date     | Release    | Change                                            |
| -------- | ---------- | ------------------------------------------------- |
| 20200617 | 20200617.2 | Add support for Spot instance and disk encryption |
| 20200617 | 20200617.1 | 1st release                                       |
