function Get-CoveDevices {
    <#
    .SYNOPSIS
        Gets devices from the Cove API
    .DESCRIPTION
        Gets devices from the Cove API, using the credentials stored in the script
    .EXAMPLE
        Get-CoveDevices -Verbose
        Gets devices from the Cove API
    .EXAMPLE
        Get-CoveDevices -PartnerId 1234 -Verbose
        Gets devices from the Cove API for the partner with ID 1234
    #>
    [CmdletBinding()]
    param (
        # The ID of the partner to get devices for
        [Parameter()]
        [int]$PartnerId
    )

    begin {

    }

    process {
        $params = @{
            CoveMethod = 'EnumerateAccounts'
            Params = @{
                partnerid = $PartnerId ? $PartnerId : $Script:CoveApiSession.PartnerInfo.id
            }
            Id = 'jsonrpc'
        }

        $Data = Invoke-CoveApiRequest @params
        if ($Data) {
            return $Data
        }
        Write-Error "Failed to get devices"
    }

    end {

    }
}