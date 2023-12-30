---
external help file: CoveBackupApi-help.xml
Module Name: CoveBackupApi
online version:
schema: 2.0.0
---

# Convert-CoveUnixTime

## SYNOPSIS
A helper functions used to convert unix timestamps to or from DateTime objects

## SYNTAX

### UnixTime
```
Convert-CoveUnixTime -UnixTime <Int32> [-DateTime <DateTime>] [-ProgressAction <ActionPreference>]
 [<CommonParameters>]
```

### DateTime
```
Convert-CoveUnixTime [-UnixTime <Int32>] -DateTime <DateTime> [-ProgressAction <ActionPreference>]
 [<CommonParameters>]
```

## DESCRIPTION
The Cove API provides timestamps in unix format, this function converts them to DateTime objects

## EXAMPLES

### EXAMPLE 1
```
Convert-CoveUnixTime -UnixTime 1685522071
Converts the unix timestamp 1685522071 to a DateTime object
```

## PARAMETERS

### -UnixTime
one of either the UnixTime or DateTime parameters must be specified
The unix timestamp to convert

```yaml
Type: Int32
Parameter Sets: UnixTime
Aliases:

Required: True
Position: Named
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

```yaml
Type: Int32
Parameter Sets: DateTime
Aliases:

Required: False
Position: Named
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -DateTime
The DateTime object to convert

```yaml
Type: DateTime
Parameter Sets: UnixTime
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

```yaml
Type: DateTime
Parameter Sets: DateTime
Aliases:

Required: True
Position: Named
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
