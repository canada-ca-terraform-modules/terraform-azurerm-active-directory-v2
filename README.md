# Active Directory Domain Controlers

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
terraform {
  required_version = ">= 0.12.1"
}
provider "azurerm" {
  version = ">= 1.32.0"
  # subscription_id = "2de839a0-37f9-4163-a32a-e1bdb8d6eb7e"
}

data "azurerm_client_config" "current" {}

module "addsvms" {
  source = "github.com/canada-ca-terraform-modules/terraform-azurerm-active-directory?ref=20200421.1"

  ad_domain_name        = "mgmt.demo.gc.ca.local"
  reverse_Zone_Object   = "2.250.10"
  ad_prefix             = "adds"
  resourceGroupName     = "${var.envprefix}-MGMT-ADDS-RG"
  admin_username        = "azureadmin"
  secretPasswordName    = "server2016DefaultPassword"
  subnetName            = "${var.envprefix}-MGMT-APP"
  vnetName              = "${var.envprefix}-Core-NetMGMT-VNET"
  vnetResourceGroupName = "${var.envprefix}-Core-NetMGMT-RG"
  rootDC1IPAddress      = "100.96.122.4"
  rootDC2IPAddress      = "100.96.122.5"
  dnsServers            = ["168.63.129.16"]
  vm_size               = "Standard_D2_v3"
  
  keyVaultName              = "someKeyVaultName"
  keyVaultResourceGroupName = "someKeyVaultRGName"
}
```

## Parameter Values

TO BE DOCUMENTED

### Tag variable

| Name     | Type   | Required | Value      |
| -------- | ------ | -------- | ---------- |
| tagname1 | string | No       | tag1 value |
| ...      | ...    | ...      | ...        |
| tagnameX | string | No       | tagX value |

## History

| Date     | Release    | Change                                     |
| -------- | ---------- | ------------------------------------------ |
| 20200421 | 20200421.1 | Removing tags from extensions              |
| 20190806 | 20190806.1 | Add support for custom DNS Server Override |
| 20190801 | 20190801.1 | Remove unnecessary script step             |
| 20190731 | 20190731.1 | 1st release                                |
