function New-CoveApiSession {
    <#
    .SYNOPSIS
        Initiates a login session with the Cove API
    .DESCRIPTION
        Checks for an existing visa and if none is found, initiates a login session with the Cove API
    .EXAMPLE
        Test-MyTestFunction -Verbose
        Explanation of the function or its result. You can include multiple examples with additional .EXAMPLE lines
    #>
    
    
    [CmdletBinding()]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSAvoidUsingPlainTextForPassword', '')]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSAvoidUsingUsernameAndPasswordParams', '')]
    param (
        
    )
    
    begin {
    }
    
    process {
        
        if (Test-CoveApiVisa) {
            Write-Verbose "Visa found, no need to login"
            return
        }
        if (!$Script:CoveApiCredentials) {
            Write-Output "No credentials found, please run New-CoveApiCredentials to set the credentials for Cove API"
            return $null
        }


        $params = @{
            ContentType = 'application/json'
            Method = 'POST'
            Body = @{
                jsonrpc = '2.0'
                method = 'Login'
                id = 2
                params = @{
                    username = $Script:CoveApiCredentials.User
                    password = (New-Object PSCredential 'user', $Script:CoveApiCredentials.Password).GetNetworkCredential().Password
                    partner = $Script:CoveApiCredentials.Partner
                }
            } | ConvertTo-Json
            Uri = $Script:CoveApiCredentials.Url
            UseBasicParsing = $true
            SessionVariable = 'CoveSession'
        }

        try {
            $Request = Invoke-WebRequest @params
        }
        catch {
            Throw "Failed to login to Cove API: $($_.Exception.Message)"
        }

        New-Variable -Name CoveApiSession -Scope Script -Visibility Private -Force -Value @{}

        try {
            $Response = $Request | ConvertFrom-Json
            $Script:CoveApiSession.cookies = $CoveSession.Cookies.GetCookies($Script:CoveApiCredentials.Url)
            $Script:CoveApiSession.visa = $Response.visa
            $Script:CoveApiSession.userid = $Response.result.result.userid
        }
        catch {
            Throw "Failed to parse Cove API response: $($_.Exception.Message)"
        }
        if ($Response.error) {
            Throw "Failed to login to Cove API: $($Response.error.message)"
        }
        if (!$Script:CoveApiSession.visa) {
            Throw "Failed to login to Cove API: No visa returned"
        }

        # Set the expiry time for the visa
        $Script:CoveApiSession.validfrom = (Get-Date -Date "1970-01-01 00:00:00Z").ToUniversalTime().AddSeconds($Script:CoveApiSession.visa.split('-')[3])

        Write-Verbose "Login successful, visa valid from $($Script:CoveApiSession.validfrom)"

    }
    
    end {
        
    }
}