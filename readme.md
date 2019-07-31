[![Build Status](https://dev.azure.com/itreyhayden/Posh-Scaffolding/_apis/build/status/treyhay31.posh-scaffolding?branchName=master)](https://dev.azure.com/itreyhayden/Posh-Scaffolding/_build/latest?definitionId=1&branchName=master)
# Function Scaffolding

Here are a few scripts and templates that will make writing modular powershell more pleasant.

# This is IT!!! The ULTIMATE!
```{powershell}
(New-Object System.Net.WebClient).DownloadFile("https://github.com/treyhay31/posh-scaffolding/archive/master.zip", "$($env:UserProfile)\Downloads\module.zip"); $env:PSModulePath -Split ";" | ForEach-Object { Expand-Archive -Path "$($env:UserProfile)\Downloads\module.zip" -Destination "$_\" -Force }
```

## Develop it! (fix this nonsense)

```PowerShell

# After you've cloned
.\Posh-Init.ps1 # I KNOW! This should be its own module

# New Module!!
New-Moddd "GG"

# New Function!!! it's a public function in the GG module! (also an INTERNAL option)
New-FuncInMod "Run-Something" "GG" "Public"

# New Function!!! it has nothing to do with any modules!!!
New-Funccc "Say-NotSomething"

```

## Use it!

```Powershell

Import-Module pshcaffolding #powershell gallery

New-PModule ... # creates new folder/symlink/...

New-PFunction ... # Function-Name Module-Name

New-PScript ... # Creates script in Scripts/

```
