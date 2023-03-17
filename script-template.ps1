#Living Template of Powershell Script with
#Parameters
#Error Handling
#Logging
#to be improved while I'm learning :)

param (
    [Parameter(Mandatory)] [String] $MandatoryStringParameter,
    [Parameter()] [string] $NonMandatoryStringParameter
)

#Try..Catch with $ErrorActionPreference
#Set the global variable $ErrorActionPreference to “Stop” 
# OR 
#Use the cmdlet parameter -ErrorAction to ensure any error from that cmdlet is terminating.
try  
{
    #Do Stuff
    Write-Output $MandatoryStringParameter
    Write-OutPut $NonMandatoryStringParameter
}
#catch [System.Net.WebException] #Catch a specific .NET Exception
#{
#    "Unable to download the file from the website."
#}
catch #General Catch 
{
    <#Do this if a terminating exception happens#>
    Write-Host "An Error occurred:"
    Write-Host $_
}
finally
{
    $Error.Clear()

}