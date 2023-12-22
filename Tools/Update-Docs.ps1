$ModuleName = "CoveBackupApi"
Build-Module
Remove-Module $ModuleName -Force | Out-Null
$Version = Get-ChildItem -Path .\Output\$ModuleName -Directory | Select-Object -Last 1 -ExpandProperty Name
Import-Module .\Output\$ModuleName\$Version\$ModuleName.psm1
Write-Output "Generating markdown help files"
Get-Module $ModuleName | New-MarkdownHelp -OutputFolder .\Docs\ -Force