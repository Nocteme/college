
for($Numclasse = 300; $Numclasse -le 608; $Numclasse++)
{

    switch ( $Numclasse )
    {
        308{$Numclasse = 400}
        408{$Numclasse = 500}
        508{$Numclasse = 600}
    }
    $IP = "172.18.20.221"
    $path = "\\$IP\PARTAGES`$\CLASSES\$Numclasse"
    $Groupe1 ="DL_"+ $Numclasse +"_RW"
    $Groupe2 ="DL_"+ $Numclasse +"_RO" 
    
    $acl = Get-Acl $path
    $acl.SetAccessRuleProtection($true,$true)
    Set-Acl -aclobject $acl -Path $path

    $acl = Get-Acl $path
    $AccessRule = New-Object System.Security.AccessControl.FileSystemAccessRule("$Groupe1","FullControl","ContainerInherit , ObjectInherit", "None", "Allow")
    $acl.RemoveAccessRule($AccessRule)
    Set-Acl $path $acl

    $acl = Get-Acl $path
    $AccessRule = New-Object System.Security.AccessControl.FileSystemAccessRule("$Groupe2","FullControl","ContainerInherit , ObjectInherit", "None", "Allow")
    $acl.RemoveAccessRule($AccessRule)
    Set-Acl $path $acl




    $pathINFD = "\\$IP\PARTAGES`$\CLASSES\$Numclasse\DONNEES"
    $pathINFPEDA = "\\$IP\PARTAGES`$\CLASSES\$Numclasse\EQUIPE_PEDAGOGIQUE"
    $pathINFTRA = "\\$IP\PARTAGES`$\CLASSES\$Numclasse\TRAVAIL"

    
    $Groupe1TRAVAIL = "DL_"+ $Numclasse +"_TRAVAIL_RW"
    $Groupe2TRAVAIL = "DL_"+ $Numclasse +"_RO"
    $Groupe3TRAVAIL = "DL_PROF-"+$Numclasse+"_TRAVAIL_RW" 


    $acl = Get-Acl $pathINFTRA
    $rule = New-Object System.Security.AccessControl.FileSystemAccessRule("$Groupe1TRAVAIL","FullControl", "ContainerInherit, ObjectInherit", "None", "Allow")#remplacer write par perm ntfs 
    $acl.RemoveAccessRule($rule)
    Set-Acl $pathINFTRA $acl

    $acl = Get-Acl $pathINFTRA
    $rule = New-Object System.Security.AccessControl.FileSystemAccessRule("$Groupe2TRAVAIL","FullControl", "ContainerInherit, ObjectInherit", "None", "Allow")#remplacer write par perm ntfs 
    $acl.RemoveAccessRule($rule)
    Set-Acl $pathINFTRA $acl

    $acl = Get-Acl $pathINFTRA
    $rule = New-Object System.Security.AccessControl.FileSystemAccessRule("$Groupe3TRAVAIL","FullControl", "ContainerInherit, ObjectInherit", "None", "Allow")#remplacer write par perm ntfs 
    $acl.RemoveAccessRule($rule)
    Set-Acl $pathINFTRA $acl


    $Groupe1DONNEES = "DL_"+ $Numclasse +"_RW"
    $Groupe2DONNEES = "DL_"+ $Numclasse +"_RO"

    $acl = Get-Acl $pathINFD
    $rule = New-Object System.Security.AccessControl.FileSystemAccessRule("$Groupe1DONNEES","FullControl", "ContainerInherit, ObjectInherit", "None", "Allow")#remplacer write par perm ntfs 
    $acl.RemoveAccessRule($rule)
    Set-Acl $pathINFD $acl

    $acl = Get-Acl $pathINFD
    $rule = New-Object System.Security.AccessControl.FileSystemAccessRule("$Groupe2DONNEES","FullControl", "ContainerInherit, ObjectInherit", "None", "Allow")#remplacer write par perm ntfs 
    $acl.RemoveAccessRule($rule)
    Set-Acl $pathINFD $acl
}