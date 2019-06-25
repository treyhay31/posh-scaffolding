Describe Get-Tucker {
  Mock Start-Sleep { return } 

  It "Needs to have real tests... This should pass..." {
      $true | Should be $true
  }

  It "Needs to return directories on C:\ drive..." {
    
    $expected = Get-ChildItem C:\ -Directory

    $result = Get-Tucker "DEV"
    $result.count | Should BeExactly $expected.count
  }

  It "Needs to be fast..." {
    
    $expected = Get-ChildItem C:\ -Directory

    $result = Get-Tucker "DEV"
    $result.count | Should BeExactly $expected.count
  }
}
