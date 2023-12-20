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
                parentpartnerid = $ParenbtPartnerId ? $ParentPartnerId : (Get-CovePartnerInfo).Id
                fields = @(0,1,3,4,5,8,9,10,18,20)
                fetchrecursively = $true
            }
            Id = 'jsonrpc'
        }

        $Companies = Invoke-CoveApiRequest @params
        if ($Companies) {

            $Data = foreach ($Company in $Companies) {
                @{
                    Name = $Company.0
                    Level = $Company.1
                    'Child Service Types' = $Company.3
                    'Service Type' = $Company.4
                    State = $Company.5
                    'Location ID' = $Company.8
                    'Flags' = $Company.9
                    'Company Info' = $Company.10
                    'ExternalCode, MailFrom' = $Company.18
                    'Created Time' = $Company.20
                }
            }

            return $Data
        }
        return $null
    }

    end {

    }
}