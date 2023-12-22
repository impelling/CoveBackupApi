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
{{ Fill in the Description }}

## EXAMPLES

### EXAMPLE 1
```
Test-MyTestFunction -Verbose
Explanation of the function or its result. You can include multiple examples with additional .EXAMPLE lines
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

## NOTES
Information or caveats about the function e.g.
'This function is not supported in Linux'

## RELATED LINKS

[Specify a URI to a help page, this will show when Get-Help -Online is used.]()

