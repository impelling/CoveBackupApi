function Get-CovePartnerInfo {
    <#
    .SYNOPSIS
        Gets the partner information for the Cove API
    .DESCRIPTION
        Gets the partner information for the Cove API, using the credentials stored in the script
    .EXAMPLE
        Get-CovePartnerInfo -Verbose
        Gets the partner information for the Cove API
    .OUTPUTS
        System.Management.Automation.PSCustomObject
    #>
    [CmdletBinding()]
    param (

    )

    begin {

    }

    process {
        $params = @{
            CoveMethod = 'GetPartnerInfo'
            Params = @{
                name = $Script:CoveApiCredentials.Partner
            }
        }
        $Data = Invoke-CoveApiRequest @params
        if ($Data) {
            foreach ($Property in $Data.psobject.Properties) {
                if ($Property.Name -in $UnixTimeFields) {
                    $Property.Value = Convert-CoveUnixTime -UnixTime $Property.Value
                }
            }
            return $Data
        }
        Throw "Failed to get partner info"
    }

    end {

    }
}