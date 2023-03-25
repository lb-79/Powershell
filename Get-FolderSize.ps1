function Get-FolderSize 
{
    [CmdletBinding()]
        Param (
                [Parameter(Mandatory=$true,ValueFromPipeline=$true)] $Path
    )

    $dataColl = @()
    Get-ChildItem -force $Path -Directory -ErrorAction SilentlyContinue | ForEach-Object { #Get all Directories and for each of them...
        $len = 0 #Running Total Size
        gci -recurse -force $_.fullname -ErrorAction SilentlyContinue | ForEach-Object { $len += $_.length } #Go in subdirectories and update the running total size.
        $foldername = $_.fullname #Get the fullname of the folder
        $foldersize= '{0:N2}' -f ($len / 1Gb) #-f The -f operator Format a string expression.
        $dataObject = New-Object PSObject #Build a temporary object to store data
        Add-Member -inputObject $dataObject -memberType NoteProperty -name "FolderName" -value $foldername #We want to store folder name
        Add-Member -inputObject $dataObject -memberType NoteProperty -name "SizeGB" -value $foldersize #...and size
        $dataColl += $dataObject #add this "record" to our object
    }
    $dataColl | Format-Table -AutoSize #Show the output in a friendly way.


}