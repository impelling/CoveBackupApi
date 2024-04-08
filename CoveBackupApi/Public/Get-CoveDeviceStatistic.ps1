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
    .OUTPUTS
        System.Collections.ArrayList
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
        $StatsFields = Get-CoveDataMap -DataMap StatsFields

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

        $Columns = @(
            foreach ($Column in $ColumnHeaders.GetEnumerator()) {
                $Column.Key
            }
            foreach ($Source in $DataSources.GetEnumerator()) {
                foreach ($Field in $StatsFields.GetEnumerator()) {
                    "$($Source.Key)$($Field.Key)"
                }
            }
        )

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
                    Columns = $Columns
                    OrderBy = "$(Get-CoveDataMap -FieldName 'Company Name') ASC"
                }
            }
            Id = 'jsonrpc'
        }



        Write-Verbose "Getting devices statatistics for Partner '$($params.Params.query.PartnerId)' with filter $($params.Params.query.Filter)"

        $Data = Invoke-CoveApiRequest @params
        if ($Data) {
            $UnixTimeFields = Get-CoveUnixTimeFields
            $DeviceStats = [System.Collections.ArrayList]@()
            foreach ($Statistic in $Data) {
                $DeviceStat = [PSCustomObject]@{
                    PartnerId = $Statistic.PartnerId
                    AccountId = $Statistic.AccountId
                }
                foreach ($Setting in $Statistic.Settings.GetEnumerator()) {
                    foreach ($Property in $Setting.psobject.Properties) {
                        $NameSubstring = $Property.Name.Length -gt 3 ? $Property.Name.Substring($Property.Name.Length - 3) : $null
                        if ($Property.Name -is [string] -and ($Property.Name -in $UnixTimeFields -or ($NameSubstring -in $UnixTimeFields))) {
                            $Value = Convert-CoveUnixTime -UnixTime $Property.Value
                        }
                        else {
                            switch ($Property.Name) {
                                'I78' { # Data sources new column code
                                    $Sources =  $($Setting.Value -split 'D' | Where-Object { $_ -ne '' })
                                    $Value = foreach ($Source in $Sources) {
                                        $DataSources.GetEnumerator() | Where-Object { $_.Key -eq "D$Source" } | Select-Object -ExpandProperty Value
                                    }
                                }
                                default {
                                    $Value = $Property.Value
                                }
                            }
                        }
                        try {
                            $ColumnName = $ColumnHeaders.GetEnumerator() | Where-Object { $_.Key -eq $Property.Name } | Select-Object -ExpandProperty Value
                        }
                        catch {
                            $ColumnName = $null
                        }
                        if (!$ColumnName) {
                            $Keys = $Property.Name -split 'F'
                            $Keys[1] = "F$($Keys[1])"
                            $Source = $DataSources.GetEnumerator() | Where-Object { $_.Key -eq $Keys[0] } | Select-Object -ExpandProperty Value
                            $Field = $StatsFields.GetEnumerator() | Where-Object { $_.Key -eq $Keys[1] } | Select-Object -ExpandProperty Value
                            $ColumnName = "$Source $Field"
                        }
                        $ColumnName = $ColumnName ? $ColumnName : $Property.Name
                        $DeviceStat | Add-Member -MemberType NoteProperty -Name $ColumnName -Value $Value
                    }
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