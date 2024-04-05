# CoveBackupApi - A [Cove Backup](https://www.n-able.com/products/cove-data-protection/backup) [PowerShell](https://microsoft.com/powershell) module
[![PowerShell Gallery](https://img.shields.io/powershellgallery/dt/CoveBackupApi?style=for-the-badge)](https://www.powershellgallery.com/packages/CoveBackupApi/)
[![License](https://img.shields.io/github/license/impelling/CoveBackupApi?style=for-the-badge)](https://github.com/impelling/CoveBackupApi/blob/main/LICENSE.md)
[![Stable Release](https://img.shields.io/powershellgallery/v/CoveBackupApi?label=Stable+Release&style=for-the-badge)](https://www.powershellgallery.com/packages/CoveBackupApi/)
[![Preview Release](https://img.shields.io/powershellgallery/v/CoveBackupApi?include_prereleases&label=Preview%20Release&style=for-the-badge)](https://www.powershellgallery.com/packages/CoveBackupApi/)
[![Publish Status](https://github.com/impelling/CoveBackupApi/actions/workflows/publish.yml/badge.svg?style=for-the-badge)](https://github.com/impelling/CoveBackupApi/actions/workflows/publish.yml)


## About this repository

This is the code for a Powershell module to interact with the Cove backup API.

It is written purely for [PowerShell 7.1](https://docs.microsoft.com/en-us/powershell/scripting/whats-new/what-s-new-in-powershell-71?view=powershell-7.1) or greater. No apologies will be made for failures in Powershell 5.1.

## Limitations

This module is a work in progress. It is possible to connect to the API and retrieve certain data. It is not currently possible add or set elements using this module.

## Installation

```PowerShell
Install-Module CoveBackupApi
```

## Getting started

### Create an API authentication credential

Ideally, create a dedicated user and enable API authentication for it. Create this user at the account level to ensure you have access to all customer accounts when using this module.

Record the username and password for the API user, along with the full Partner name.
The partner name will be in the format `Company Name Ltd (accountowner@domain.tld)`

### Connect to the API using the credential above

```PowerShell
$script:ApiParams = @{
    User = 'yourapiuser@yourdomain.tld'
    Partner = 'Company Name Ltd (accountowner@domain.tld)'
    Password = ConvertTo-SecureString -AsPlainText -String 'yoursupersecurepasswordstring' -Force
}

New-CoveApiCredential @script:ApiParams
New-CoveApiSession -Verbose
```

## Functions

All functions are documented in the Docs directory within the project repo.