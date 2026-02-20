#  fl * (Para mostrar todos los parametros ocultos)
# Where-Object {$_.Shared -eq $true} (Filtrar solo las compartidas)
#Get-Printer -Full | Select-Object Name, Shared, 

$resultados = "C:\ResultadoScripts"
if (!(Test-Path $resultados)) { 
    New-Item $ruta -Type Directory
}

$impresoras = Get-WmiObject Win32_Printer | Select-Object Name, Shared, 
    @{Name="Usuarios Autorizados"; Expression={(($_.GetSecurityDescriptor().Descriptor.DACL).Trustee.Name -join ", ")}} 

$impresoras
$impresoras | Out-File "$resultados\InfoImpresora.txt"
