$ModuleName = "CoveBackupApi"
Build-Module -VersionedOutputDirectory:$false
Remove-Module $ModuleName -Force -ErrorAction SilentlyContinue
Import-Module .\Output\$ModuleName\$ModuleName.psm1
Write-Output "Generating markdown help files"
Get-Module $ModuleName | New-MarkdownHelp -OutputFolder .\Docs\ -Force