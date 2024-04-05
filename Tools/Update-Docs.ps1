# Get the tools directory from this script
$ScriptPath = $MyInvocation.MyCommand.Path
$ToolsDirectory = Split-Path $ScriptPath

. (Join-Path $ToolsDirectory Invoke-BuildAndImport.ps1)

Write-Output "Generating markdown help files"
Get-ChildItem -Path .\Docs\ -Filter *.md | Remove-Item -Force
Get-Module $ModuleName | New-MarkdownHelp -OutputFolder .\Docs\ -Force