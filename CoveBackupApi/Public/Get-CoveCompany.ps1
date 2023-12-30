function Get-CoveCompany {
    <#
    .SYNOPSIS
        Gets companies from the Cove API
    .DESCRIPTION
        Gets companies from the Cove API, using the credentials stored in the script
    .PARAMETER ParentPartnerId
        The ID of the partner to get companies for
    .PARAMETER Sites
        Whether to return only sites, default is to return companies
    .EXAMPLE
        Get-CoveCompany -Verbose
        Gets companies from the Cove API
    .EXAMPLE
        Get-CoveCompany -ParentPartnerId 123456 -Verbose
        Gets companies from the Cove API, where the parent partner ID is 123456
    .EXAMPLE
        Get-CoveCompany -CompanyId 123456 -Verbose
        Gets the company with ID 123456 from the Cove API
    #>
    [CmdletBinding()]
    param (
        # The ID of the partner to get companies for
        [Parameter()]
        [int]$ParentPartnerId,
        # The ID of the company to get
        [Parameter()]
        [int]$CompanyId,
        # Whether to return only sites, default is to return companies
        [Parameter()]
        [switch]$Sites
    )

    begin {

    }

    process {
        $params = @{
            CoveMethod = 'EnumeratePartners'
            Params = @{
                parentPartnerId = $ParentPartnerId ? $ParentPartnerId : $Script:CoveApiSession.PartnerInfo.id
                fields = @(0,1,3,4,5,8,9,10,18,20)
                fetchRecursively = $true
            }
            Id = 'jsonrpc'
        }

        $Data = Invoke-CoveApiRequest @params
        if ($Data) {
            $UnixTimeFields = Get-CoveUnixTimeFields
            foreach ($Company in $Data.GetEnumerator()) {
                foreach ($Property in $Company.psobject.Properties) {
                    if ($Property.Name -in $UnixTimeFields) {
                        $Property.Value = Convert-CoveUnixTime -UnixTime $Property.Value
                    }
                }
            }

            if ($CompanyId) {
                # This endpoint does not support filtering by ID, so we have to do it ourselves
                return $Data | Where-Object {$_.Id -eq $CompanyId}
            }
            if ($Sites) {
                return $Data | Where-Object {$_.Level -eq 'Site'}
            }
            else {
                return $Data | Where-Object {$_.Level -ne 'Site'}
            }
        }

    }

    end {

    }
}