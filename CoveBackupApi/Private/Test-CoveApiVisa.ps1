function Test-CoveApiVisa {
    <#
    .SYNOPSIS
        Tests to see if a valid visa exists for the Cove API
    .DESCRIPTION
        Checks for an existing valid visa
    .EXAMPLE
        Test-CoveApiVisa -Verbose
        Uses the script's default credentials to test for a valid visa
    .OUTPUTS
        System.Boolean
    #>
    [CmdletBinding()]
    param (

    )

    begin {

    }

    process {
        if (!$Script:CoveApiSession) {
            Write-Verbose "No visa found"
            return $false
        }
        if ($Script:CoveApiSession.validfrom -lt (Get-Date).ToUniversalTime().AddMinutes(-10)) {
            Write-Verbose "Visa expired, valid until $(($Script:CoveApiSession.validfrom).AddMinutes(15))"
            return $false
        }
        Write-Verbose "Visa found, valid until $(($Script:CoveApiSession.validfrom).AddMinutes(15))"
        return $true
    }

    end {

    }
}