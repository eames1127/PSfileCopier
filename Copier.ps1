param (
    [string] $copyFrom,
    [string] $copyTo
)

$extFilter = "*.ps1", "*.md", "*.docx"
$continue = "y"

Write-Host "Copy from location" $copyFrom
Write-Host "Copy to location" $copyTo

if($extFilter -eq "")
{
    Write-Host "No file extension(s) have been specified, are you sure you want to continue? y/n"
    $continue = Read-Host
}
if(-not($continue.ToLower() -eq 'y'))
{
    Write-Host "Aborted"
}
else {    
    foreach ($file in Get-ChildItem -Path $copyFrom "\*" -Recurse -Include $extFilter)
    {
        Write-Host "Copying" $file "to" $copyTo
        Copy-Item $file -Destination $copyTo -Confirm
    }
    Write-Host "Finished copying files to" $copyTo
}
Write-Host "Script complete."

pause