function Get-Tucker
{
  <#
    .Synopsis
      Short description
    .DESCRIPTION
      Long description
    .EXAMPLE
      Example of how to use this cmdlet
  #>
  [CmdletBinding(SupportsShouldProcess=$true)]  
  param (
    [Parameter(Mandatory=$true, 
      ValueFromPipeline=$true,  
      ValueFromPipelineByPropertyName=$true)]
    [ValidateSet("DEV", "STG", "PRD")] 
    [string]$environment

  )  
  
  BEGIN{
    $stuff = (Get-Childitem "C:\" -Directory).FullName 
  }#begin 
  PROCESS{

    if ($psCmdlet.ShouldProcess($stuff, "Getting Tucker")) { 
      ## action goes here
      ### allows you to use the -whatif param on this function
      Start-Sleep -s 10
      get-childitem "C:\" -Directory
    }

  }#process 
  END{

  }#end  
}
