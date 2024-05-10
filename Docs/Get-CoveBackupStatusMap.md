---
external help file: CoveBackupApi-help.xml
Module Name: CoveBackupApi
online version:
schema: 2.0.0
---

# Get-CoveBackupStatusMap

## SYNOPSIS
Gets the status descriptions for the numeric values returned from the Cove API

## SYNTAX

```
Get-CoveBackupStatusMap [[-FieldName] <String>] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Returns objects with the status descriptions for the numeric values returned from the Cove API

## EXAMPLES

### EXAMPLE 1
```
Get-CoveBackupStatusMap
Gets the full map
```

### EXAMPLE 2
```
Get-CoveBackupStatusMap -FieldName 'In Progress'
Returns the numeric value for the status label 'In Progress'
> 1
```

## PARAMETERS

### -FieldName
The field name to return the key for

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: None
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

### System.Collections.Hashtable
## NOTES

## RELATED LINKS
