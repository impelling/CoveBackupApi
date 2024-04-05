Build-Module -VersionedOutputDirectory:$false

$ModuleName = Get-ChildItem -Path .\Output -Directory | Select-Object -First 1 -ExpandProperty Name

Remove-Module $ModuleName -Force -ErrorAction SilentlyContinue
Import-Module .\Output\$ModuleName\$ModuleName.psm1
