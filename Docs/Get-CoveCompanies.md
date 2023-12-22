---
external help file: CoveBackupApi-help.xml
Module Name: CoveBackupApi
online version:
schema: 2.0.0
---

# Get-CoveCompanies

## SYNOPSIS
Gets companies from the Cove API

## SYNTAX

```
Get-CoveCompanies [[-ParentPartnerId] <Int32>] [-Sites] [-ProgressAction <ActionPreference>]
 [<CommonParameters>]
```

## DESCRIPTION
Gets companies from the Cove API, using the credentials stored in the script

## EXAMPLES

### EXAMPLE 1
```
Get-CoveCompanies -Verbose
Gets companies from the Cove API
```

### EXAMPLE 2
```
Get-CoveCompanies -ParentPartnerId 123456 -Verbose
Gets companies from the Cove API, where the parent partner ID is 123456
```

## PARAMETERS

### -ParentPartnerId
The ID of the partner to get companies for

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -Sites
Whether to return only sites, default is to return companies

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
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

## RELATED LINKS
