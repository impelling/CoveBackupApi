function Get-CoveCompanyInfo {
    <#
    .SYNOPSIS
        Gets detailed company info from the Cove API
    .DESCRIPTION
        Gets information fro the Cove API for a specified company, using the credentials stored in the script
    .PARAMETER CompanyId
        The ID of the company to get info for
    .EXAMPLE
        Get-CoveCompanyInfo -CompanyId 12345 -Verbose
        Gets information for the company with ID 12345 from the Cove API
    .OUTPUTS
        System.Management.Automation.PSCustomObject
    #>
    [CmdletBinding()]
    param (
        # The ID of the company to get information for
        [Parameter(Mandatory)]
        [int]$CompanyId
    )

    begin {

    }

    process {
        $params = @{
            CoveMethod = 'GetPartnerInfoById'
            Params = @{
                partnerId = $CompanyId
            }
            Id = 'jsonrpc'
        }



        $Data = Invoke-CoveApiRequest @params
        if ($Data) {
            $UnixTimeFields = Get-CoveUnixTimeFields
            foreach ($Property in $Data.psobject.Properties) {
                if ($Property.Name -in $UnixTimeFields) {
                    $Property.Value = Convert-CoveUnixTime -UnixTime $Property.Value
                }
            }
            return $Data
        }

    }

    end {

    }
}