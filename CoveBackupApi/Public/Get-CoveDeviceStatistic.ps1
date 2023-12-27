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
    [OutputType([System.Collections.ArrayList])]
    [CmdletBinding()]
    param (
        # The ID of the partner to get devices for
        [Parameter()]
        [int]$PartnerId,
        # Filter by type of account - Must be M365, Servers, or Workstations
        [Parameter()]
        [ValidateSet('M365','Hardware')]
        [string]$BackupType
    )

    begin {

    }

    process {

        $ColumnHeaders = Get-CoveDataMap -DataMap ColumnHeaders
        $DataSources = Get-CoveDataMap -DataMap DataSources

        $Filter = ''
        if ($BackupType) {
            switch ($BackupType) {
                'M365' {
                    $TypeID = 2
                }
                'Hardware' {
                    $TypeID = 1
                }
                default {
                }
            }
            $Filter = "$($ColumnHeaders | Where-Object {$_.Value -eq 'Account Type'} | Select-Object -ExpandProperty Key) == $($TypeID)"
        }

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
            $DeviceStats = [System.Collections.ArrayList]@()
            foreach ($Statistic in $Data) {
                $DeviceStat = [PSCustomObject]@{
                    PartnerId = $Statistic.PartnerId
                    AccountId = $Statistic.AccountId
                }
                foreach ($Column in $ColumnHeaders.GetEnumerator()) {
                    $Value = $Statistic.Settings.$($Column.Key) -join ''
                    switch ($Column.Key) {
                        'I78' {
                            $Sources =  $($Value -split 'D' | Where-Object { $_ -ne '' })
                            $Value = foreach ($Source in $Sources) {
                                $DataSources.GetEnumerator() | Where-Object { $_.Key -eq "D$Source" } | Select-Object -ExpandProperty Value
                            }
                        }
                    }
                    $DeviceStat | Add-Member -MemberType NoteProperty -Name $Column.Value -Value $Value
                }
                $DeviceStats.Add($DeviceStat) | Out-Null
            }

            return $DeviceStats

        }
        return $null
    }

    end {

    }
}