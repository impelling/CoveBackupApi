function Invoke-CoveApiRequest {
    <#
    .SYNOPSIS
        Performs a request to the Cove API
    .DESCRIPTION
        A private function, will invoke a request to the Cove API when used within the CoveBackupApi module
    .EXAMPLE
        $params = @{
            CoveMethod = 'EnumeratePartners'
            Params = @{
                parentPartnerId = 123456
                fields = @(0,1,3,4,5,8,9,10,18,20)
                fetchRecursively = $true
            }
            Id = 'jsonrpc'
        }
        $CoveCompanies = Invoke-CoveApiRequest @params
        Gets all companies from the Cove API where the Partner ID is 123456
    .OUTPUTS
        System.Management.Automation.PSCustomObject
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
        Write-Debug "Sending request to $CoveMethod via $Method $($RequestParams | ConvertTo-Json -Depth 10)"
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