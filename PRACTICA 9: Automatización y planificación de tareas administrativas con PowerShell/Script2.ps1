Import-Module ActiveDirectory
Get-ADUSER -Filter * -Properties Enabled 

foreach ($U in $Usuarios) {
Write-Host "Usuario: " $U.SamAccountName
if ($U.Enabled) {
Write-Host "Estado: Habilitado"
} else {
Write-Host "Estado: Deshabilitado"
}


$Grupos = Get-ADPRincipalGroupMembership $U 
foreach ($G in $Grupos) {
Write-Host "Grupo: " $G.Name
}
}
