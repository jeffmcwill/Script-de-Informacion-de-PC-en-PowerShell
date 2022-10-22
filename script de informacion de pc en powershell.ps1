function Portada(){
    write-host "----------------------------------------------------"
    write-host "
___________                                          
\__    ___/___________    _____ ___________    ______
  |    |  \_  __ \__  \  /     \\____ \__  \  /  ___/
  |    |   |  | \// __ \|  Y Y  \  |_> > __ \_\___ \ 
  |____|   |__|  (____  /__|_|  /   __(____  /____  >
                      \/      \/|__|       \/     \/
             Hecho por Jeff McWill V.1 
        "
    write-host "---------------------------------------------------"
}

Portada
try{
    do{
        write-host "-------------------------
1.Discos conectados
2.Datos sobre la pc 1
3.Informacion sobre usuario actual
4.Procesos actuales
5.Conexiones Wifi del PC
6.Servicios ejecutandoce actualmente
7.Procesador del PC
8.Memorias ram del PC
9.Motherboard del PC
10.Idioma del sistema operativo
11.Geo-Localizacion del sistema operativo
-------------------------
12.Cerrar"

        $usuario = read-host ">>> "
        try{
            switch($usuario)
            {
                {$_ -eq 1} {
                    write-host "Has elegido los discos de tu pc."
                    write-host "mostrando..."
                    Get-Disk
                    break
                }
                {$_ -eq 2} {
                    write-host "has elegido los datos sobre la pc."
                    dxdiag
                    break
                }
                {$_ -eq 3} {
                    write-host "Has elegido informacion de usuario actual"
                    write-host "dime el nombre de tu computadora"
                    try{
                        $nombrepc = read-host ">>> "
                        Get-LocalUser -name $nombrepc|fl
                        break
                    }
                    Catch {
                        Write-Warning "nombre del pc erroneo."
                        break
                    }
                }
                {$_ -eq 4} {
                    write-host "Has elegido procesos actuales"
                    Get-Process
                    break
                }
                {$_ -eq 5}{
                    write-host "Has elegido conexiones wifi"
                    netsh wlan show profiles
                    break
                }
                {$_ -eq 6}{
                    write-host "Has elegido los servicios ejecutandose actualmente"
                    get-service|Where-Object{$_.Status -eq "running"}
                    break
                }
                {$_ -eq 7}{
                    write-host "Has elegido el Procesador del PC"
                    Get-CimInstance -ClassName Win32_Processor|fl
                    break
                }
                {$_ -eq 8}{
                    write-host "Has elegido Memorias ram del PC."
                    Get-WmiObject win32_physicalmemory | Format-Table Manufacturer,
                    Banklabel,Configuredclockspeed,Devicelocator,Capacity,Serialnumber -autosize
                    break
                }
                {$_ -eq 9}{
                    write-host "Has elegido MotherBoard"
                    Get-WmiObject Win32_BaseBoard
                    break
                }
                {$_ -eq 10}{
                    write-host "Idioma del sistema operativo"
                    Get-Culture
                    break
                }
                {$_ -eq 11}{
                    write-host "Geolocalizacion del sistema"
                    Get-WinHomeLocation
                    break
                }
                {$_ -eq 12}{
                    write-host "Hasta luego."
                    break
                }
        
            }
    
    }catch{
            Write-Warning "Solo ingrese numeros."
            break 
    }
    }
    until($usuario -eq 12)
        break
    }catch {
        Write-Warning "caracteres no soportados por el programa."
        break
    }
    finally {
        Write-Output "fin de la ejecucion"
    }
    
