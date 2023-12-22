---
external help file: CoveBackupApi-help.xml
Module Name: CoveBackupApi
online version:
schema: 2.0.0
---

# Get-CoveDeviceStatistic

## SYNOPSIS
Gets devices from the Cove API

## SYNTAX

```
Get-CoveDeviceStatistic [[-PartnerId] <Int32>] [[-BackupType] <String>] [-ProgressAction <ActionPreference>]
 [<CommonParameters>]
```

## DESCRIPTION
Gets devices from the Cove API, using the credentials stored in the script

## EXAMPLES

### EXAMPLE 1
```
Get-CoveDeviceStatistic -Verbose
Gets devices from the Cove API
```

### EXAMPLE 2
```
Get-CoveDeviceStatistic -PartnerId 1234 -Verbose
Gets devices from the Cove API for the partner with ID 1234
```

## PARAMETERS

### -PartnerId
The ID of the partner to get devices for

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

### -BackupType
Filter by type of account - Must be M365, Servers, or Workstations

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

### System.Collections.ArrayList
## NOTES

## RELATED LINKS
