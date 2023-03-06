foreach ($srv in Get-Content "servers.txt")
{
    Write-Host "---------------------------------------------"
    Write-Host $srv
    Write-Host "Opening remote connection to $srv ..."
    $session = New-PSSession -ComputerName $srv
    $ver = Invoke-Command -Session $session -ScriptBlock { $PSVersionTable.PSVersion.Major}
    if ($ver -gt 4)
    {
        Write-Host "PS Version:" $ver
        Write-Host "Upgrade not needed."
    }
    else 
    {
        #upgrade code
        Write-Host "PS Version:" $ver
        Write-Host "Upgrade needed."
        Write-Host "Deploying Powershell Package to $ver ..."
        Copy-Item -Path 'c:\temp\packagefolder' -Destination 'c:\temp\packagefolder' -ToSession $session -Force -Recurse
        Write-Host "Copy completed. Installing package..."
        Invoke-Command -Session $session -ScriptBlock {c:\temp\packagefolder\install.ps1} -Verbose
        Write-Host "Installation completed."
    }
    Write-Host "Closing remote session with $srv ..."
    $session | Remove-PSSession


}