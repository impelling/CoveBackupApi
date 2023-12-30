function Get-CoveUnixTimeFields {
    <#
    .SYNOPSIS
        Gets the Unix fields for the Cove API
    .DESCRIPTION
        Gets the Unix fields for the Cove API
    .EXAMPLE
        Get-CoveUnixFields -Verbose
        Returns the Unix fields for the Cove API
    #>
    [CmdletBinding()]
    param (

    )

    begin {

    }

    process {
        $UnixTimeFields = @(
            'CreationTime',
            'ExpirationTime',
            'TrialExpirationTime',
            'TrialRegistrationTime',
            'Timestamp',
            'I6',
            'Expiration date',
            'I5',
            'Creation date',
            'I4',
            'F09', # Last successful session timestamp
            'F15', # Last session timestamp
            'F18' # Last completed session timestamp
        )
        return $UnixTimeFields

    }

    end {

    }
}