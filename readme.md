# Function Scaffolding

Here are a few scripts and templates that will make writing modular powershell more pleasant.

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
