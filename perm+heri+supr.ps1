##################################################################################################################################################################################################
########################################################################################### PARTIE 1 #############################################################################################
##################################################################################################################################################################################################



for($Numclasse = 300; $Numclasse -le 608; $Numclasse++){ # 608 = NOM DERNIER DOSSIER
    switch ( $Numclasse )
    {
        308{$Numclasse = 400}                          #CHANGER EN FONCTION DES GRP
        408{$Numclasse = 500}                          #CHANGER EN FONCTION DES GRP
        508{$Numclasse = 600}                          #CHANGER EN FONCTION DES GRP
    }
    $Numclasse = [string]$Numclasse

    $IP = "172.18.20.221"                              #IP SERVEUR
    $path = "\\$IP\PARTAGES`$\CLASSES\$Numclasse"      #CHEMIN D'ACCES AU SRV
    $Groupe2 = "DL_"+ $Numclasse +"_RO"                #NOM PREMIER GROUPE
    ######################################################################### SET PERM + ADD + HERITAGE ##########################################################################################

    ######### PREMIER GROUPE ###########

    $acl = Get-Acl $path
    $rule = New-Object System.Security.AccessControl.FileSystemAccessRule("$Groupe2","ReadAndExecute", "ContainerInherit, ObjectInherit", "None", "Allow")#remplacer write par perm ntfs 
    $acl.AddAccessRule($rule)
    Set-Acl $path $acl

    ######### PREMIER GROUPE ###########

    ######### SUPR HERITAGE ############

    $acl = Get-Acl $path
    $acl.SetAccessRuleProtection($true,$true)   
    Set-Acl -aclobject $acl -Path $path

    ######### SUPR HERITAGE ############

    ######### SUPR UTILISATEURS ########
    $acl = Get-Acl $path
    $AccessRule = New-Object System.Security.AccessControl.FileSystemAccessRule("Utilisateurs","FullControl","ContainerInherit , ObjectInherit", "None", "Allow")
    $acl.RemoveAccessRule($AccessRule)
    Set-Acl $path $acl

    ######### SUPR UTILISATEURS ########

    $Numclasse = [int]$Numclasse

    ########################################################################  INFDOS  ###################################################################################################################
                

    $pathINFD = "\\$IP\PARTAGES`$\CLASSES\$Numclasse\DONNEES"
    $pathINFPEDA = "\\$IP\PARTAGES`$\CLASSES\$Numclasse\EQUIPE_PEDAGOGIQUE"
    $pathINFTRA = "\\$IP\PARTAGES`$\CLASSES\$Numclasse\TRAVAIL"


    ########################################################################  TRAVAIL  ###################################################################################################################
    
    $Groupe1TRAVAIL = "DL_"+ $Numclasse +"_TRAVAIL_RW"
    $Groupe2TRAVAIL = "DL_"+ $Numclasse +"_RO"
    $Groupe3TRAVAIL = "DL_PROF-"+$Numclasse+"_TRAVAIL_RW" 


    $acl = Get-Acl $pathINFTRA
    $rule = New-Object System.Security.AccessControl.FileSystemAccessRule("$Groupe1TRAVAIL","Write , ReadAndExecute", "ContainerInherit, ObjectInherit", "None", "Allow")#remplacer write par perm ntfs 
    $acl.AddAccessRule($rule)
    Set-Acl $pathINFTRA $acl

    $acl = Get-Acl $pathINFTRA
    $rule = New-Object System.Security.AccessControl.FileSystemAccessRule("$Groupe2TRAVAIL","Write , ReadAndExecute", "ContainerInherit, ObjectInherit", "None", "Allow")#remplacer write par perm ntfs 
    $acl.AddAccessRule($rule)
    Set-Acl $pathINFTRA $acl

    $acl = Get-Acl $pathINFTRA
    $rule = New-Object System.Security.AccessControl.FileSystemAccessRule("$Groupe3TRAVAIL","Write , ReadAndExecute", "ContainerInherit, ObjectInherit", "None", "Allow")#remplacer write par perm ntfs 
    $acl.AddAccessRule($rule)
    Set-Acl $pathINFTRA $acl

    ########################################################################  DONNEES  ###################################################################################################################

    $Groupe1DONNEES = "DL_"+ $Numclasse +"_RW"
    $Groupe2DONNEES = "DL_"+ $Numclasse +"_RO"

    $acl = Get-Acl $pathINFD
    $rule = New-Object System.Security.AccessControl.FileSystemAccessRule("$Groupe1DONNEES","Write , ReadAndExecute", "ContainerInherit, ObjectInherit", "None", "Allow")#remplacer write par perm ntfs 
    $acl.AddAccessRule($rule)
    Set-Acl $pathINFD $acl

    $acl = Get-Acl $pathINFD
    $rule = New-Object System.Security.AccessControl.FileSystemAccessRule("$Groupe2DONNEES","Write , ReadAndExecute", "ContainerInherit, ObjectInherit", "None", "Allow")#remplacer write par perm ntfs 
    $acl.AddAccessRule($rule)
    Set-Acl $pathINFD $acl


}

##################################################################################################################################################################################################
########################################################################################### PARTIE 2 #############################################################################################
##################################################################################################################################################################################################
