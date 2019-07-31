function Get-ModulePath
{
  <#
    .Synopsis
      Gets the current user's parent of $PSModule 
    .DESCRIPTION
      Long description
    .EXAMPLE
      Example of how to use this cmdlet
  #>

  [CmdletBinding()]  
  param (
    [Parameter(
        Mandatory=$true, 
        ValueFromPipeline=$true,
        ValueFromPipelineByPropertyName=$true)]
    [ValidateScript({Test-Path $_ -PathType Container})] 
    [string]$path
  )  

  BEGIN{}#begin 
  PROCESS{

    if ("os" -eq "linux"){
      (((Get-ChildItem ($path -Split ":")[0])[0].Parent).Parent).FullName
    } else {
      (((Get-ChildItem ($path -Split ";")[0])[0].Parent).Parent).FullName
    }


  }#process 
  END{}#end  
}
