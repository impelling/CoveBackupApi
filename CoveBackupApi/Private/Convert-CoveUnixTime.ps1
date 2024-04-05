function Convert-CoveUnixTime {
    <#
    .SYNOPSIS
        A helper functions used to convert unix timestamps to or from DateTime objects
    .DESCRIPTION
        The Cove API provides timestamps in unix format, this function converts them to DateTime objects
    .EXAMPLE
        Convert-CoveUnixTime -UnixTime 1685522071
        Converts the unix timestamp 1685522071 to a DateTime object
    .OUTPUTS
        System.DateTime or
        System.Int32 unix timestamp
    #>


    [CmdletBinding()]
    param (
        # one of either the UnixTime or DateTime parameters must be specified
        [Parameter(Mandatory, ParameterSetName = 'UnixTime')]
        # The unix timestamp to convert
        [Parameter()]
        [int]$UnixTime,
        [Parameter(Mandatory, ParameterSetName = 'DateTime')]
        # The DateTime object to convert
        [Parameter()]
        [datetime]$DateTime

    )

    begin {

    }

    process {
        $Epoch = New-Object DateTime 1970, 1, 1, 0, 0, 0, ([DateTimeKind]::Utc)
        if ($UnixTime) {
            return $Epoch.AddSeconds($UnixTime)
        }
        elseif ($DateTime) {
            return ($DateTime - $Epoch).TotalSeconds
        }
    }

    end {

    }
}