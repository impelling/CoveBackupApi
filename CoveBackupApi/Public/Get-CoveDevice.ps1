function Get-CoveDevice {
    <#
    .SYNOPSIS
        Gets devices from the Cove API
    .DESCRIPTION
        Gets devices from the Cove API, using the credentials stored in the script
    .EXAMPLE
        Get-CoveDevice -Verbose
        Gets all devices from the Cove API
    .EXAMPLE
        Get-CoveDevice -PartnerId 1234 -Verbose
        Gets devices from the Cove API for the partner with ID 1234
    .EXAMPLE
        Get-CoveDevice -DeviceId 1234 -Verbose
        Gets the device with ID 1234 from the Cove API
    .OUTPUTS
        System.Management.Automation.PSCustomObject
    #>
    [CmdletBinding()]
    param (
        # The ID of the device to get
        [Parameter()]
        [int]$DeviceId,
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
                partnerId = $PartnerId ? $PartnerId : $Script:CoveApiSession.PartnerInfo.id
            }
            Id = 'jsonrpc'
        }

        $Data = Invoke-CoveApiRequest @params
        if ($Data) {
            $UnixTimeFields = Get-CoveUnixTimeFields
            foreach ($Device in $Data.GetEnumerator()) {
                foreach ($Property in $Device.psobject.Properties) {
                    if ($Property.Name -in $UnixTimeFields) {
                        $Property.Value = Convert-CoveUnixTime -UnixTime $Property.Value
                    }
                }
            }
            if ($DeviceId) {
                # This endpoint does not support API level filtering, so we'll simulate it with the results
                $Data = $Data | Where-Object { $_.Id -eq $DeviceId }
            }
            return $Data
        }
        Write-Warning "Failed to get devices"
    }

    end {

    }
}