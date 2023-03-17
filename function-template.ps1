#Living Template of Powershell Function with
#Parameters
#Error Handling
#Logging
#to be improved while I'm learning :)

Function Verb-Noun
{
    # CmdletBinding --> To use a PowerShell functions as a standard C# cmdlet from the command line --  . 
    # SupportsShouldProcess -> to use Whatif
    # ConfirmImpact -> to prompt the user for actions
    [CmdletBinding(SupportsShouldProcess=$true,ConfirmImpact='High')] 
    param (
        [Parameter(Mandatory)] [String] $MandatoryStringParameter,
        [Parameter()] [string] $NonMandatoryStringParameter
    )
    
    Begin
    {

    }

    Process 
    {
        try 
        {
            if($PSCmdlet.ShouldProcess($MandatoryStringParameter,"Describe the operation"))
            {
                #Perform an operation, i.e.
                #$File = New-Item -Path $FilePath -ItemType File -Force -ErrorAction Stop
            }        
        }
        catch 
        {
            <#Do this if a terminating exception happens#>
            Throw "$($_.Exception.Message)"
        }
    }

    End
    {

    }

}


