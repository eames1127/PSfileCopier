param (
    [string] $copyFrom,
    [string] $copyTo
)

$extFilter = "*.ps1", "*.md", "*.docx"
$continue = "y"

if($copyFrom -eq "")
{
    $copyFrom = Get-Location
}

Write-Host "Copy from location" $copyFrom -ForegroundColor DarkYellow
Write-Host "Copy to location" $copyTo -ForegroundColor DarkYellow

if($extFilter -eq "")
{
    Write-Host "No file extension(s) have been specified, are you sure you want to continue? y/n" -ForegroundColor DarkYellow
    $continue = Read-Host
}
if(-not($continue.ToLower() -eq 'y'))
{
    Write-Host "Aborted" -ForegroundColor Red
}
else {    
    foreach ($file in Get-ChildItem -Path $copyFrom "\*" -Recurse -Include $extFilter)
    {
        Write-Host "Copying" $file "to" $copyTo
        Copy-Item $file -Destination $copyTo -Confirm
    }
    Write-Host "Finished copying files to" $copyTo -ForegroundColor DarkYellow
}
Write-Host "Script complete." -ForegroundColor Green

pause