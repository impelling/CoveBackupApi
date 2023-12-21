function Get-CoveCompanies {
    <#
    .SYNOPSIS
        Gets companies from the Cove API
    .DESCRIPTION
        Gets companies from the Cove API, using the credentials stored in the script
    .PARAMETER ParentPartnerId
        The ID of the partner to get companies for
    .EXAMPLE
        Get-CoveCompanies -Verbose
        Gets companies from the Cove API
    .EXAMPLE
        Get-CoveCompanies -ParentPartnerId 123456 -Verbose
        Gets companies from the Cove API, where the parent partner ID is 123456
    #>
    [CmdletBinding()]
    param (
        # The ID of the partner to get companies for
        [Parameter()]
        [int]$ParentPartnerId
    )

    begin {

    }

    process {
        $params = @{
            CoveMethod = 'EnumeratePartners'
            Params = @{
                parentPartnerId = $PartnerId ? $PartnerId : $Script:CoveApiSession.PartnerInfo.id
                fields = @(0,1,3,4,5,8,9,10,18,20)
                fetchRecursively = $true
            }
            Id = 'jsonrpc'
        }

        $Data = Invoke-CoveApiRequest @params
        if ($Data) {
            $Companies = $Data | Where-Object {$_.Level -ne 'Site'}
            return $Companies
        }

        return $null
    }

    end {

    }
}