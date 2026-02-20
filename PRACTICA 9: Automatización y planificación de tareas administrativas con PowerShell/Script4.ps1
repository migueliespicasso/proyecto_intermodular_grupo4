Write-Host "Las carpetas compartidas son:"
Get-SmbShare
 $CarpetaEleguida = Read-Host "Elige la carpeta quieres ver sus permisos"
Get-SmbShareAccess -Name $CarpetaEleguida >> "C:\ResultadoScripts\InfoRecursos.txt"
