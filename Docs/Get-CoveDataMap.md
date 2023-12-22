---
external help file: CoveBackupApi-help.xml
Module Name: CoveBackupApi
online version:
schema: 2.0.0
---

# Get-CoveDataMap

## SYNOPSIS
Gets the data maps for the Cove API

## SYNTAX

```
Get-CoveDataMap [[-DataMap] <String>] [[-FieldName] <String>] [-ProgressAction <ActionPreference>]
 [<CommonParameters>]
```

## DESCRIPTION
Returns objects with the data map for the Cove API given the parameter passed

## EXAMPLES

### EXAMPLE 1
```
Get-CoveDataMap
Gets the full data map
```

### EXAMPLE 2
```
Get-CoveDataMap -DataMap DataSources
Gets the backup data source types
```

### EXAMPLE 3
```
Get-CoveDataMap -DataMap ColumnHeaders
Gets the column headers returned from the API
```

### EXAMPLE 4
```
Get-CoveDataMap -FieldName 'Hyper-V'
Returns the column ID for the Hyper-V field (D14)
```

## PARAMETERS

### -DataMap
The data map to return

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

### -FieldName
The field name to return the column ID for

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
