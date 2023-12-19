function New-CoveApiCredential {
    <#
    .SYNOPSIS
        Sets the credentials for the Cove API
    .DESCRIPTION
        Stores the attributes required by the Cove API to authenticate
    .PARAMETER User
        The username of the API user provided by Cove
    .PARAMETER Password
        The password of the user provided by Cove
    .PARAMETER Partner
        The partner name displayed in the Cove portal, with the format "PartnerName (admin@partnerdomain.tld)"
    .PARAMETER Url
        The URL for the Cove API (default: https://api.backup.management/jsonapi)
    .EXAMPLE
        $creds = @{
            User = 'username@domain.tld'
            Password = 'supersecurepassword' | ConvertTo-SecureString -AsPlainText -Force
            Partner = 'PartnerName (admin@partnerdomain.tld)'
        }
        New-CoveApiCredential @creds
        Stores the required attributes for the Cove API to use in future calls
    .EXAMPLE
        $creds = @{
            User = 'username@domain.tld'
            Password = 'supersecurepassword' | ConvertTo-SecureString -AsPlainText -Force
            Partner = 'PartnerName (admin@partnerdomain.tld)'
            Url = 'https://api.backup.management/jsonapi'
        }
        New-CoveApiCredential @creds
        Overrides the default URL for the Cove API and stores the required attributes for the Cove API to use in future calls

    #>


    [CmdletBinding(SupportsShouldProcess)]
    param (
        # Username for the API
        [Parameter(Mandatory = $true)]
        [string]$User,
        # Password for the API
        [Parameter(Mandatory = $true)]
        [securestring]$Password,
        # Partner name displayed in the Cove portal
        [Parameter(Mandatory = $true)]
        [string]$Partner,
        # URL for the Cove API (default: https://api.backup.management/jsonapi)
        [Parameter()]
        [string]$Url = "https://api.backup.management/jsonapi"
    )


    begin {

    }

    process {
        if (!$User) {
            $User = Read-Host -Prompt "Enter the username for the Cove API"
        }
        if (!$Password) {
            $Password = Read-Host -Prompt "Enter the password for the Cove API" -AsSecureString
        }
        if (!$Partner) {
            $Partner = Read-Host -Prompt "Enter the partner name displayed in the Cove portal"
        }

        $Script:creds = @{
            User = $User
            Password = $Password
            Partner = $Partner
            Url = $Url
        }

        Set-Variable -Name CoveApiCredentials -Value $script:creds -Scope Script -Visibility Private -Force

    }

    end {
        Remove-Variable -Name creds -Scope Script -Force
    }
}