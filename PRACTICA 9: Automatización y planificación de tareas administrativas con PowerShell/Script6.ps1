$carpeta = "C:\ResultadoScripts"
if (!(Test-Path $carpeta)) { New-Item $carpeta -Type Directory }

$disco = Get-CimInstance Win32_LogicalDisk -Filter "DeviceID='C:'"
$max = [math]::Round($disco.Size / 1GB, 2)
$libre = [math]::Round($disco.FreeSpace / 1GB, 2)
$ocupado = [math]::Round($max - $libre, 2)

$inicio = (Get-CimInstance Win32_OperatingSystem).LastBootUpTime
# qwinsta | Select-String ">"
$user = (-split (qwinsta | Select-String ">"))[1]

$informe = @"
-------------------------------------------------------
Ultimo inicio de sesion: $inicio
Disco C: $ocupado GB ocupados / $max GB totales
Sesiones actuales:
Usuario: $user - Estado: Activo
-------------------------------------------------------
"@

$informe
$informe | Out-File "$carpeta\InfoUtils.txt" -Encoding utf8
