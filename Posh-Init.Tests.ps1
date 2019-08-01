Describe "Running Posh Init" {
  It "Posh-Init.ps1 should take in a Drive letter so that we can pass it a PSDrive for testing" {
    "Testing some stuff in here..." | Should be "Not Testing some stuff in here..."
  }

  $psModuleBuilderPath = "Documents\WindowsPowerShell\Modules\PSModuleBuilder" 

  It "Posh-Init.ps1 should install/configure the psmodule builder onto the user's machine" {
    Test-Path "$HOME\$psModuleBuilderPath" -PathType Container | Should be $true
  }

  It "Posh-Init.ps1 should create 'New-PsScript' as a public function" {
    Test-Path "$HOME\$psModuleBuilderPath\Public\New-PsScript.ps1" -PathType Leaf | Should be $true
  }
  It "Posh-Init.ps1 should create 'New-PsScript' tests" {
    Test-Path "$HOME\$psModuleBuilderPath\Public\New-PsScript.Tests.ps1" -PathType Leaf | Should be $true
  }
  It "Posh-Init.ps1 should create 'New-PsFunction' as a public function" {
    Test-Path "$HOME\$psModuleBuilderPath\Public\New-PsFunction.ps1" -PathType Leaf | Should be $true
  }
  It "Posh-Init.ps1 should create 'New-PsFunction' tests" {
    Test-Path "$HOME\$psModuleBuilderPath\Public\New-PsFunction.Tests.ps1" -PathType Leaf | Should be $true
  }
  It "Posh-Init.ps1 should create 'New-PsModule' as a public function" {
    Test-Path "$HOME\$psModuleBuilderPath\Public\New-PsModule.ps1" -PathType Leaf | Should be $true
  }
  It "Posh-Init.ps1 should create 'New-PsModule' tests" {
    Test-Path "$HOME\$psModuleBuilderPath\Public\New-PsModule.Tests.ps1" -PathType Leaf | Should be $true
  }
  It "Posh-Init.ps1 should create 'Set-PsModulePath' as a public function" {
    Test-Path "$HOME\$psModuleBuilderPath\Public\Set-PsModulePath.ps1" -PathType Leaf | Should be $true
  }
  It "Posh-Init.ps1 should create 'Set-PsModulePath' tests" {
    Test-Path "$HOME\$psModuleBuilderPath\Public\Set-PsModulePath.Tests.ps1" -PathType Leaf | Should be $true
  }
  It "Posh-Init.ps1 should create 'Get-PsModulePath' as a public function" {
    Test-Path "$HOME\$psModuleBuilderPath\Public\Get-PsModulePath.ps1" -PathType Leaf | Should be $true
  }
  It "Posh-Init.ps1 should create 'Get-PsModulePath' tests" {
    Test-Path "$HOME\$psModuleBuilderPath\Public\Get-PsModulePath.Tests.ps1" -PathType Leaf | Should be $true
  }
  It "Posh-Init.ps1 should create 'Get-UserPsModulePath' as a private function" {
    Test-Path "$HOME\$psModuleBuilderPath\Private\Get-UserPsModulePath.ps1" -PathType Leaf | Should be $true
  }
  It "Posh-Init.ps1 should create 'Get-UserPsModulePath' tests" {
    Test-Path "$HOME\$psModuleBuilderPath\Private\Get-UserPsModulePath.Tests.ps1" -PathType Leaf | Should be $true
  }
}