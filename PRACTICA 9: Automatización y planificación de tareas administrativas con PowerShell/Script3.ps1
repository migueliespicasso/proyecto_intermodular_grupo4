$cliente = Read-Host "Introduce la Ip del usuario especifico"
$equipo = Read-Host "Introduce la el nombre del equipo"


Write-Host "Comprobando conectividad del Router"
$conexionRouter = Test-NetConnection -ComputerName "192.168.1.1"
$conexionRouter >> "C:\ResultadoScripts\InfoUsuarios.txt"

if ($conexionRouter.PingSucceeded) {
    Write-Host "Conectado" -ForegroundColor Green
} else {
    Write-Host "No se pudo conectar" -ForegroundColor Red
}

Write-Host "Comprobando conectividad del Server"
$conexionServer = Test-NetConnection -ComputerName "192.168.1.1"
$conexionServer >> "C:\ResultadoScripts\InfoUsuarios.txt"

if ($conexionServer.PingSucceeded) {
    Write-Host "Conectado" -ForegroundColor Green
} else {
    Write-Host "No se pudo conectar" -ForegroundColor Red
}


Write-Host "Comprobando conectividad del $equipo"
$conexionEquipo = Test-NetConnection -ComputerName "192.168.1.1"
$conexionEquipo >> "C:\ResultadoScripts\InfoUsuarios.txt"

if ($conexionEquipo.PingSucceeded) {
    Write-Host "Conectado" -ForegroundColor Green
} else {
    Write-Host "No se pudo conectar" -ForegroundColor Red
}
