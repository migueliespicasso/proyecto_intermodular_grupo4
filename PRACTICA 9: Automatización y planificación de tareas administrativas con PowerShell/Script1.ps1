$Equipo = $env:COMPUTERNAME
$Usuario = $env:USERNAME
$SO = (Get-CimInstance Win32_OperatingSystem).Caption
$IP = (Get-NetIPAddress -AddressFamily IPv4).IPAddress

$ruta = "C:\ResultadoScripts\InfoSistema.txt"
Write-Host
$informacion = @(
 "Nombre del usuario: $Equipo"
 "Usuario: $Usuario"
 "Sistema: $SO"
 "IP: $IP"

)

$informacion | Out-File $ruta