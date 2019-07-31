.\Get-ModulePath

Describe Get-ModulePath { 

  $userWindowsModulePath = "C:\Users\some-user\OneDrive\Documents\WindowsPowerShell\Modules"
  $userLinuxModulePath = "/Users/some-user/.local/share/powershell/Modules"

  $modulePath = @{
    windows = "$userWindowsModulePath;C:\Program Files\WindowsPowerShell\Modules;C:\Windows\system32\WindowsPowerShell\v1.0\Modules;C:\Users\some-user\.vscode\extensions\ms-vscode.powershell-2019.5.0\modules"
    linux = "$($userLinuxModulePath):/usr/local/share/powershell/Modules:/usr/local/microsoft/powershell/6.0.1/Modules:/Users/some-user/.vscode/extensions/ms-vscode.powershell-2019.5.0/modules"
  }

  $expected = @{
    windows = $userWindowsModulePath
    linux = $userLinuxModulePath
  } 

  $actualWindows = Get-ModulePath $modulePath.windows
  "windows actual: $actualWindows"
  "windows expected: $($expected.windows)"
  It "On windows, it should grab the user's module path" {
    $actualWindows | Should be $expected.windows
  }
  
  $actualLinux = Get-ModulePath $modulePath.linux

  It "On linux, it should grab the user's module path" {
    $actualLinux | Should be $expected.linux
  }
}
