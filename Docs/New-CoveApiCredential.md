---
external help file: CoveBackupApi-help.xml
Module Name: CoveBackupApi
online version:
schema: 2.0.0
---

# New-CoveApiCredential

## SYNOPSIS
Sets the credentials for the Cove API

## SYNTAX

```
New-CoveApiCredential [-User] <String> [-Password] <SecureString> [-Partner] <String> [[-Url] <String>]
 [-ProgressAction <ActionPreference>] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Stores the attributes required by the Cove API to authenticate

## EXAMPLES

### EXAMPLE 1
```
$creds = @{
    User = 'username@domain.tld'
    Password = 'supersecurepassword' | ConvertTo-SecureString -AsPlainText -Force
    Partner = 'PartnerName (admin@partnerdomain.tld)'
}
New-CoveApiCredential @creds
Stores the required attributes for the Cove API to use in future calls
```

### EXAMPLE 2
```
$creds = @{
    User = 'username@domain.tld'
    Password = 'supersecurepassword' | ConvertTo-SecureString -AsPlainText -Force
    Partner = 'PartnerName (admin@partnerdomain.tld)'
    Url = 'https://api.backup.management/jsonapi'
}
New-CoveApiCredential @creds
Overrides the default URL for the Cove API and stores the required attributes for the Cove API to use in future calls
```

## PARAMETERS

### -User
The username of the API user provided by Cove

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Password
The password of the user provided by Cove

```yaml
Type: SecureString
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Partner
The partner name displayed in the Cove portal, with the format "PartnerName (admin@partnerdomain.tld)"

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Url
The URL for the Cove API (default: https://api.backup.management/jsonapi)

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: Https://api.backup.management/jsonapi
Accept pipeline input: False
Accept wildcard characters: False
```

### -WhatIf
Shows what would happen if the cmdlet runs.
The cmdlet is not run.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: wi

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Confirm
Prompts you for confirmation before running the cmdlet.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: cf

Required: False
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
