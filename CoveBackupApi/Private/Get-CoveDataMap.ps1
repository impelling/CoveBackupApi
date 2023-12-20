function Get-CoveDataMap {
    <#
    .SYNOPSIS
        Gets the data maps for the Cove API
    .DESCRIPTION
        Returns objects with the data map for the Cove API given the parameter passed
    .PARAMETER DataMap
        The data map to return
    .PARAMETER FieldName
        The field name to return the column ID for
    .EXAMPLE
        Get-CoveDataMap
        Gets the full data map
    .EXAMPLE
        Get-CoveDataMap -DataMap DataSources
        Gets the backup data source types
    .EXAMPLE
        Get-CoveDataMap -DataMap ColumnHeaders
        Gets the column headers returned from the API
    .EXAMPLE
        Get-CoveDataMap -FieldName 'Hyper-V'
        Returns the column ID for the Hyper-V field (D14)
    #>


    [CmdletBinding()]
    param (
        # The data map to return
        [Parameter()]
        [ValidateSet('DataSources','ColumnHeaders','StatsFields')]
        [string]$DataMap,
        # Get the column header for a specific field name
        [Parameter()]
        [string]
        $FieldName

    )

    begin {

    }

    process {

        $FullMap = @{
            D1    = 'Files and Folders'
            D2    = 'System State'
            D3    = 'MsSql'
            D4    = 'VssExchange'
            D5    = 'Microsoft 365 SharePoint'
            D6    = 'NetworkShares'
            D7    = 'VssSystemState'
            D8    = 'VMware Virtual Machines'
            D9    = 'Total'
            D10   = 'VssMsSql'
            D11   = 'VssSharePoint'
            D12   = 'Oracle'
            D14   = 'Hyper-V'
            D15   = 'MySql'
            D16   = 'Virtual Disaster Recovery'
            D17   = 'Bare Metal Restore'
            D19   = 'Microsoft 365 Exchange'
            D20   = 'Microsoft 365 OneDrive'
            D23   = 'Microsoft 365 Teams'
            F00   = 'Last Session Status' #  1 – In process, 2 – Failed, 3 – Aborted, 5 – Completed, 6 – Interrupted, 7 – NotStarted, 8 – CompletedWithErrors, 9 – InProgressWithFaults, 10 – OverQuota, 11 – NoSelection, 12 – Restarted
            F01   = 'Last Session Selected Count'
            F02   = 'Last Session Processed Count'
            F03   = 'Last Session Selected Size'
            F04   = 'Last Session Processed Size'
            F05   = 'Last Session Sent Size'
            F06   = 'Last Session Errors Count'
            F07   = 'Protected size'
            F08   = 'Color bar – last 28 days'
            F09   = 'Last successful session Timestamp'
            F10   = 'Pre Recent Session Selected Count'
            F11   = 'Pre Recent Session Selected Size'
            F12   = 'Session duration'
            F13   = 'Last Session License Items count'
            F14   = 'Retention'
            F15   = 'Last Session Timestamp'
            F16   = 'Last Successful Session Status'
            F17   = 'Last Completed Session Status'
            F18   = 'Last Completed Session Timestamp'
            F19   = 'Last Session Verification Data'
            F20   = 'Last Session User Mailboxes Count'
            F21   = 'Last Session Shared Mailboxes Count'
            I0   = 'Device ID'
            I1   = 'Device name'
            I2   = 'Device name alias'
            I3   = 'Password'
            I4   = 'Creation date'
            I5   = 'Expiration date'
            I6   = 'Timestamp' #  time
            I8   = 'Customer'
            I9   = 'Product ID'
            I10   = 'Product'
            I11   = 'Storage location'
            I12   = 'Device group name'
            I13   = 'Own user name'
            I14   = 'Used storage'
            I15   = 'Email'
            I16   = 'OS version'
            I17   = 'Client version'
            I18   = 'Computer name'
            I19   = 'Internal IPs'
            I20   = 'External IPs'
            I21   = 'MAC address'
            I22   = 'Dashboard frequency'
            I23   = 'Dashboard language'
            I24   = 'Time offset'
            I26   = 'Cabinet Storage Efficiency'
            I27   = 'Total Cabinets Count'
            I28   = 'Efficient Cabinet Count 0-25'
            I29   = 'Efficient Cabinet Count 26-50'
            I30   = 'Efficient Cabinet Count 50-75'
            I31   = 'Used Virtual Storage'
            I32   = 'OS type' #  1 – workstation, 2 – server, 0 – undefined
            I33   = 'Seeding mode' #  0 – Undefined, 1 – Normal, 2 – Seeding, 3 – PreSeeding, 4 – PostSeeding
            I34   = 'Anti Crypto enabled'
            I35   = 'LSV' #  0 – Disabled, 1 – Enabled
            I36   = 'Storage status' #  2 – Offline, 1 – Failed, 0 – Undefined, 50 – Running, 100 – Synchronized
            I37   = 'LSV status' #  2 – Offline, 1 – Failed, 0 – Undefined, 50 – Running, 100 – Synchronized
            I38   = 'Archived size'
            I39   = 'Retention units'
            I40   = 'Activity description'
            I41   = 'Number of Hyper-V virtual machines'
            I42   = 'Number of ESX virtual machines'
            I43   = 'Encryption status'
            I44   = 'Computer manufacturer'
            I45   = 'Computer model'
            I46   = 'Installation ID'
            I47   = 'Installation Mode'
            I48   = 'Restore email'
            I49   = 'Restore dashboard frequency'
            I50   = 'Restore dashboards language'
            I54   = 'Profile ID'
            I55   = 'Profile version'
            I56   = 'Profile'
            I57   = 'Stock Keeping Unit'
            I58   = 'Stock Keeping Unit of the previous month'
            I59   = 'Account type'
            I60   = 'Proxy Type'
            I62   = 'Most Recent Restore Plugin'
            I63   = 'Company Name'
            I64   = 'Address'
            I65   = 'Zip Code'
            I66   = 'Country'
            I67   = 'City'
            I68   = 'Phone Number'
            I69   = 'Fax Number'
            I70   = 'Contract Name'
            I71   = 'Group Name'
            I72   = 'Demo'
            I73   = 'Edu'
            I74   = 'Unattended Installation account ID'
            I75   = 'First Installation Flag'
            I76   = 'Maximum Allowed Version'
            I77   = 'Customer reference'
            I78   = 'Active data sources'
            I80   = 'Recovery Testing'
            I81   = 'Physicality'
            I82   = 'Passphrase'

        }
        if ($FieldName) {
            try {
                $ColumnHeaders = $FullMap.GetEnumerator() | Where-Object { $_.Value -like $FieldName } | Select-Object -ExpandProperty Key
                return $ColumnHeaders
            }
            catch {
                Write-Error "Failed to find a column header for $FieldName"
                return $null
            }
        }
        if ($DataMap -eq 'DataSources') {
            $Map = $FullMap.GetEnumerator() | Where-Object { $_.Name -like 'D*' }
        }
        if ($DataMap -eq 'StatsFields') {
            $Map = $FullMap.GetEnumerator() | Where-Object { $_.Name -like 'F*' }
        }
        if ($DataMap -eq 'ColumnHeaders') {
            $Map = $FullMap.GetEnumerator() | Where-Object { $_.Name -like 'I*' }
        }
        if (!$DataMap) {
            $Map = $FullMap
        }

        return $Map | Sort-Object -Property Value
    }

    end {

    }
}