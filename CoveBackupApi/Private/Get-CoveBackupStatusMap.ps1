function Get-CoveBackupStatusMap {
    <#
    .SYNOPSIS
        Gets the status descriptions for the numeric values returned from the Cove API
    .DESCRIPTION
        Returns objects with the status descriptions for the numeric values returned from the Cove API
    .PARAMETER FieldName
        The field name to return the key for
    .EXAMPLE
        Get-CoveBackupStatusMap
        Gets the full map
    .EXAMPLE
        Get-CoveBackupStatusMap -FieldName 'In Progress'
        Returns the numeric value for the status label 'In Progress'
        > 1
    .OUTPUTS
        System.Collections.Hashtable
    #>


    [CmdletBinding()]
    param (
        # Get the column header for a specific field name
        [Parameter()]
        [string]
        $FieldName
    )

    begin {

    }

    process {

        $DataMap = @{
            1     = 'In Progress'
            2     = 'Failed'
            3     = 'Aborted'
            5     = 'Completed'
            6     = 'Interrupted'
            7     = 'Not Started'
            8     = 'Completed With Errors'
            9     = 'In Progress With Faults'
            10    = 'Over Quota'
            11    = 'No Selection'
            12    = 'Restarted'
        }
        if ($FieldName) {
            try {
                $NumericValue = $DataMap.GetEnumerator() | Where-Object { $_.Value -like $FieldName } | Select-Object -ExpandProperty Key
                return $NumericValue
            }
            catch {
                Write-Warning "Failed to find a column header for $FieldName"
                return $null
            }
        }
        return $DataMap
    }

    end {

    }
}