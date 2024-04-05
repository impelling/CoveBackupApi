---
external help file: CoveBackupApi-help.xml
Module Name: CoveBackupApi
online version:
schema: 2.0.0
---

# Invoke-CoveApiRequest

## SYNOPSIS
Performs a request to the Cove API

## SYNTAX

```
Invoke-CoveApiRequest [[-Method] <String>] [[-CoveMethod] <String>] [[-Params] <Hashtable>]
 [[-UrlOverride] <String>] [[-Id] <String>] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
A private function, will invoke a request to the Cove API when used within the CoveBackupApi module

## EXAMPLES

### EXAMPLE 1
```
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
```

## PARAMETERS

### -Method
The request method to call

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: POST
Accept pipeline input: False
Accept wildcard characters: False
```

### -CoveMethod
The Cove method to call

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Params
The parameters to pass to the method

```yaml
Type: Hashtable
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -UrlOverride
The url to override the default

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Id
The id of the request to pass

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 5
Default value: 2
Accept pipeline input: False
Accept wildcard characters: False
```

### -ProgressAction
{{ Fill ProgressAction Description }}

```yaml
Type: ActionPreference
Parameter Sets: (All)
Aliases: proga

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

### System.Management.Automation.PSCustomObject
## NOTES

## RELATED LINKS
