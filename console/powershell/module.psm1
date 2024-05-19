$my_var = 123;
$a = ""

function Test-M { 
    param ([int]$a, [int]$b)

    return $a + $b
}

# Для Import-Module
Export-ModuleMember -Function Test-M
Export-ModuleMember -Variable my_var
