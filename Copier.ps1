param (
    [string] $copyFrom,
    [string] $copyTo
)

Write-Host "Copy from location" $copyFrom
Write-Host "Copy to location" $copyTo

foreach ($file in Get-ChildItem -Path $copyFrom "\*" -Recurse)
{
    Write-Host "Copying" $file "to" $copyTo
    Copy-Item $file -Destination $copyTo -Confirm
}

Write-Host "Finished copying files to" $copyTo
Write-Host "Script complete."

pause