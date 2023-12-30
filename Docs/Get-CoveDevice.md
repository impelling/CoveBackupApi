---
external help file: CoveBackupApi-help.xml
Module Name: CoveBackupApi
online version:
schema: 2.0.0
---

# Get-CoveDevice

## SYNOPSIS
Gets devices from the Cove API

## SYNTAX

```
Get-CoveDevice [[-DeviceId] <Int32>] [[-PartnerId] <Int32>] [-ProgressAction <ActionPreference>]
 [<CommonParameters>]
```

## DESCRIPTION
Gets devices from the Cove API, using the credentials stored in the script

## EXAMPLES

### EXAMPLE 1
```
Get-CoveDevice -Verbose
Gets all devices from the Cove API
```

### EXAMPLE 2
```
Get-CoveDevice -PartnerId 1234 -Verbose
Gets devices from the Cove API for the partner with ID 1234
```

### EXAMPLE 3
```
Get-CoveDevice -DeviceId 1234 -Verbose
Gets the device with ID 1234 from the Cove API
```

## PARAMETERS

### -DeviceId
The ID of the device to get

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

### -PartnerId
The ID of the partner to get devices for

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: 0
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
