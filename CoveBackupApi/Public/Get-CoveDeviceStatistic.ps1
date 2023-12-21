function Get-CoveDeviceStatistic {
    <#
    .SYNOPSIS
        Gets devices from the Cove API
    .DESCRIPTION
        Gets devices from the Cove API, using the credentials stored in the script
    .EXAMPLE
        Get-CoveDeviceStatistic -Verbose
        Gets devices from the Cove API
    .EXAMPLE
        Get-CoveDeviceStatistic -PartnerId 1234 -Verbose
        Gets devices from the Cove API for the partner with ID 1234
    #>
    [CmdletBinding()]
    param (
        # The ID of the partner to get devices for
        [Parameter()]
        [int]$PartnerId,
        # Filter by M365 only
        [Parameter()]
        [switch]$M365
    )

    begin {

    }

    process {

        $ColumnHeaders = Get-CoveDataMap -DataMap ColumnHeaders
        $DataSources = Get-CoveDataMap -DataMap DataSources

        $Filter = $M365 ? "$($ColumnHeaders| Where-Object {$_.Value -eq 'Account Type'} | Select-Object -ExpandProperty Key) == 1" : ''


        $params = @{
            CoveMethod = 'EnumerateAccountStatistics'
            Params = @{
                query = @{
                    PartnerId = $PartnerId ? $PartnerId : $Script:CoveApiSession.PartnerInfo.id
                    RecordsCount = 1000
                    SelectionMode = 'Merged'
                    StartRecordNumber = 0
                    Totals = @()
                    Filter = $Filter
                    Columns = @(
                        foreach ($Column in $ColumnHeaders.GetEnumerator()) {
                            $Column.Key
                        }
                    )
                    OrderBy = "$(Get-CoveDataMap -FieldName 'Company Name') ASC"
                }
            }
            Id = 'jsonrpc'
        }



        Write-Verbose "Getting devices statatistics for Partner '$($params.Params.query.PartnerId)' with filter $($params.Params.query.Filter)"

        $Data = Invoke-CoveApiRequest @params
        if ($Data) {

            return $Data
        }
        Write-Error "Failed to get devices"
    }

    end {

    }
}