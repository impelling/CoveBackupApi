function Invoke-CoveApiRequest {
    <#
    .SYNOPSIS
        Performs a request to the Cove API
    .DESCRIPTION

    .NOTES
        Information or caveats about the function e.g. 'This function is not supported in Linux'
    .LINK
        Specify a URI to a help page, this will show when Get-Help -Online is used.
    .EXAMPLE
        Test-MyTestFunction -Verbose
        Explanation of the function or its result. You can include multiple examples with additional .EXAMPLE lines
    #>


    [CmdletBinding()]
    param (
        # The request method to call
        [Parameter()]
        [string]$Method = 'POST',
        # The Cove method to call
        [Parameter()]
        [string]$CoveMethod,
        # The parameters to pass to the method
        [Parameter()]
        [hashtable]$Params,
        # The url to override the default
        [Parameter()]
        [string]$UrlOverride,
        # The id of the request to pass
        [Parameter()]
        [string]$Id = 2

    )

    begin {
        if (!(Test-CoveApiVisa)) {
                        New-CoveApiSession
        }

    }

    process {
        $RequestParams = @{
            ContentType = 'application/json'
            Method = $Method
            Body = @{
                jsonrpc = '2.0'
                method = $CoveMethod
                id = $Id
                visa = $Script:CoveApiSession.visa
                params = $Params
            } | ConvertTo-Json -Depth 20
            Uri = $UrlOverride ? $UrlOverride : $Script:CoveApiCredentials.Url
            UseBasicParsing = $true
            SessionVariable = 'CoveSession'
        }
        try {
            $Request = Invoke-WebRequest @RequestParams
        }
        catch {
            Write-Debug "Request to $CoveMethod via $Method $($Request | ConvertTo-Json -Depth 10)"
            Throw "Failed to access $CoveMethod via $Method with: $($_.Exception.Message)"
        }


        if ($Request.StatusCode -ne 200) {
            Write-Debug "Request to $CoveMethod via $Method $($Request | ConvertTo-Json -Depth 10)"
            Throw "Failed to access $CoveMethod via $Method with: $($Request.StatusCode) - $($Request.StatusDescription)"
        }

        try {
            $Response = $Request | ConvertFrom-Json
        }
        catch {
            Write-Debug "Request to $CoveMethod via $Method $($Request | ConvertTo-Json -Depth 10)"
            Throw "Failed to parse the response from $CoveMethod via $Method with: $($_.Exception.Message)"
        }



        if ($Response.error) {
            Write-Debug "Request to $CoveMethod via $Method $($Request | ConvertTo-Json -Depth 10)"
            Write-Debug "Response from $CoveMethod via $Method $($Response | ConvertTo-Json -Depth 10)"
            Throw "Failed to access $CoveMethod via $Method with: $($Response.error.message)"
        }

        $Data = $Response.result.result
        if ($Data) {
            #extend the visa stored in the session
            $Script:CoveApiSession.visa = $Response.visa
            return $Data
        }

        Write-Verbose "No data returned from $CoveMethod via $Method"

    }

    end {

    }
}