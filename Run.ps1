Set-ExecutionPolicy RemoteSigned
cd $PSScriptRoot
Import-Module -Name .\Pester -Verbose
Invoke-Pester -Show Summary -OutputFormat NUnitXML -OutputFile .\Result\testResults.xml

.\Extent\dist\extent -i .\Result\testResults.xml -o .\Result

$xmldoc = [System.Xml.XmlDocument](Get-Content ".\Result\testResults.xml")
$failures = $xmldoc."test-results"."test-suite".results."test-suite".results."test-suite" | Where-Object {$_.result -eq "Failure"} | Select -ExpandProperty name
$buf
foreach($f in $failures){
    # Write-Host $f

    switch ($f){
        "Check01"{$buf += "#Check01`r`nGet-Item -Path `'Registry::HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\PersistentRoutes`' | Select -ExpandProperty Property | %{route delete `$_.Split(`',`')[0]}`r`n`r`n"}
        "Check02"{$buf += "#Check02`r`nnetsh.exe winhttp reset proxy`r`n`r`n"}
        "Check03"{$buf += "#Check03`r`ndiskpart`r`nsan policy=onlineall`r`nexit`r`n`r`n"}
        "Check04"{$buf += "#Check04`r`nSet-ItemProperty -Path `'HKLM:\SYSTEM\CurrentControlSet\Control\TimeZoneInformation`' -Name RealTimeIsUniversal -Value 1 -Force`r`n`r`n"}
        "Check05"{$buf += "#Check05`r`nSet-Service -Name w32time -StartupType Automatic`r`n`r`n"}
        "Check06"{$buf += "#Check06`r`npowercfg.exe /setactive SCHEME_MIN`r`n`r`n"}
        "Check07"{$buf += "#Check07`r`nSet-ItemProperty -Path `'HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Environment`' -Name TEMP -Value `'%SystemRoot%\TEMP`' -Force`r`n`r`n"}
        "Check08"{$buf += "#Check08`r`nSet-ItemProperty -Path `'HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Environment`' -Name TMP -Value `'%SystemRoot%\TEMP`' -Force`r`n`r`n"}
        "Check09"{$buf += "#Check09`r`nhttps://support.microsoft.com/topic/hyper-v-integration-components-update-for-windows-virtual-machines-8a74ffad-576e-d5a0-5a2f-d6fb2594f990`r`n`r`n"}
        "Check10"{$buf += "#Check10`r`nGet-Service -Name BFE, Dhcp, Dnscache, IKEEXT, iphlpsvc, nsi, mpssvc, RemoteRegistry | Where-Object StartType -ne Automatic | Set-Service -StartupType Automatic`r`n`r`n"}
        "Check11"{$buf += "#Check11`r`nGet-Service -Name Netlogon, Netman, TermService | Where-Object StartType -ne Manual | Set-Service -StartupType Manual`r`n`r`n"}
        "Check12"{$buf += "#Check12`r`nSet-ItemProperty -Path `'HKLM:\SYSTEM\CurrentControlSet\Control\Terminal Server`' -Name fDenyTSConnections -Value 0 -Force`r`n`r`n"}
        "Check13"{$buf += "#Check13`r`nSet-ItemProperty -Path `'HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services`' -Name fDenyTSConnections -Value 0 -Force`r`n`r`n"}
        "Check14"{$buf += "#Check14`r`nSet-ItemProperty -Path `'HKLM:\SYSTEM\CurrentControlSet\Control\Terminal Server\Winstations\RDP-Tcp`' -Name PortNumber -Value 3389 -Force`r`n`r`n"}
        "Check15"{$buf += "#Check15`r`nSet-ItemProperty -Path `'HKLM:\SYSTEM\CurrentControlSet\Control\Terminal Server\Winstations\RDP-Tcp`' -Name LanAdapter -Value 0 -Force`r`n`r`n"}
        "Check16"{$buf += "#Check16`r`nSet-ItemProperty -Path `'HKLM:\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp`' -Name UserAuthentication -Value 1 -Force`r`n`r`n"}
        "Check17"{$buf += "#Check17`r`nSet-ItemProperty -Path `'HKLM:\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp`' -Name SecurityLayer -Value 1 -Force`r`n`r`n"}
        "Check18"{$buf += "#Check18`r`nSet-ItemProperty -Path `'HKLM:\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp`' -Name fAllowSecProtocolNegotiation -Value 1 -Force`r`n`r`n"}
        "Check19"{$buf += "#Check19`r`nSet-ItemProperty -Path `'HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services`' -Name KeepAliveEnable -Value 1 -Force`r`n`r`n"}
        "Check20"{$buf += "#Check20`r`nSet-ItemProperty -Path `'HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services`' -Name KeepAliveInterval -Value 1 -Force`r`n`r`n"}
        "Check21"{$buf += "#Check21`r`nSet-ItemProperty -Path `'HKLM:\SYSTEM\CurrentControlSet\Control\Terminal Server\Winstations\RDP-Tcp`' -Name KeepAliveTimeout -Value 1 -Force`r`n`r`n"}
        "Check22"{$buf += "#Check22`r`nSet-ItemProperty -Path `'HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services`' -Name fDisableAutoReconnect -Value 0 -Force`r`n`r`n"}
        "Check23"{$buf += "#Check23`r`nSet-ItemProperty -Path `'HKLM:\SYSTEM\CurrentControlSet\Control\Terminal Server\Winstations\RDP-Tcp`' -Name fInheritReconnectSame -Value 1 -Force`r`n`r`n"}
        "Check24"{$buf += "#Check24`r`nSet-ItemProperty -Path `'HKLM:\SYSTEM\CurrentControlSet\Control\Terminal Server\Winstations\RDP-Tcp`' -Name fReconnectSame -Value 0 -Force`r`n`r`n"}
        "Check25"{$buf += "#Check25`r`nSet-ItemProperty -Path `'HKLM:\SYSTEM\CurrentControlSet\Control\Terminal Server\Winstations\RDP-Tcp`' -Name MaxInstanceCount -Value 4294967295 -Force`r`n`r`n"}
        "Check26"{$buf += "#Check26`r`nif ((Get-Item -Path `'HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp`').Property -contains `'SSLCertificateSHA1Hash`'){ Remove-ItemProperty -Path `'HKLM:\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp`' -Name `'SSLCertificateSHA1Hash`' -Force }`r`n`r`n"}
        "Check27"{$buf += "#Check27`r`nSet-NetFirewallProfile -Profile Domain, Public, Private -Enabled True`r`n`r`n"}
        "Check28"{$buf += "#Check28`r`nEnable-PSRemoting -Force`r`n`r`n"}
        "Check29"{$buf += "#Check29`r`nEnable-PSRemoting -Force`r`n`r`n"}
        "Check30"{$buf += "#Check30`r`nSet-NetFirewallRule -Name WINRM-HTTP-In-TCP, WINRM-HTTP-In-TCP-PUBLIC -Enabled True`r`n`r`n"}
        "Check31"{$buf += "#Check31`r`nSet-NetFirewallRule -Group `'@FirewallAPI.dll,-28752`' -Enabled True`r`n`r`n"}
        "Check32"{$buf += "#Check32`r`nSet-NetFirewallRule -Name FPS-ICMP4-ERQ-In -Enabled True`r`n`r`n"}
        "Check33"{$buf += "#Check33`r`nNew-NetFirewallRule -DisplayName AzurePlatform -Direction Inbound -RemoteAddress 168.63.129.16 -Profile Any -Action Allow -EdgeTraversalPolicy Allow`r`nNew-NetFirewallRule -DisplayName AzurePlatform -Direction Outbound -RemoteAddress 168.63.129.16 -Profile Any -Action Allow`r`n`r`n"}
        "Check34"{$buf += "#Check34`r`nSet-ItemProperty -Path `'HKLM:\SYSTEM\CurrentControlSet\Control\CrashControl`' -Name CrashDumpEnabled -Value 2 -Force`r`n`r`n"}
        "Check35"{$buf += "#Check35`r`nSet-ItemProperty -Path `'HKLM:\SYSTEM\CurrentControlSet\Control\CrashControl`' -Name DumpFile -Value `'%SystemRoot%\MEMORY.DMP -Force`'`r`n`r`n"}
        "Check36"{$buf += "#Check36`r`nSet-ItemProperty -Path `'HKLM:\SYSTEM\CurrentControlSet\Control\CrashControl`' -Name NMICrashDump -Value 1 -Force`r`n`r`n"}
        "Check37"{$buf += "#Check37`r`nNew-Item -Path `'HKLM:\SOFTWARE\Microsoft\Windows\Windows Error Reporting`' -Name LocalDumps`r`n`r`n"}
        "Check38"{$buf += "#Check38`r`nNew-ItemProperty -Path `'HKLM:\SOFTWARE\Microsoft\Windows\Windows Error Reporting\LocalDumps`' -Name DumpFolder -Value `'C:\CrashDumps`' -Type ExpandString -Force`r`n`r`n"}
        "Check39"{$buf += "#Check39`r`nNew-ItemProperty -Path `'HKLM:\SOFTWARE\Microsoft\Windows\Windows Error Reporting\LocalDumps`' -Name CrashCount -Value 10 -Type DWord -Force`r`n`r`n"}
        "Check40"{$buf += "#Check40`r`nNew-ItemProperty -Path `'HKLM:\SOFTWARE\Microsoft\Windows\Windows Error Reporting\LocalDumps`' -Name DumpType -Value 2 -Type DWord -Force`r`n`r`n"}
        "Check41"{$buf += "#Check41`r`nSet-Service -Name WerSvc -StartupType Manual`r`n`r`n"}
        "Check42"{$buf += "#Check42`r`nwinmgmt.exe /verifyrepository`r`n`r`n"}
        "Check43"{$buf += "#Check43`r`nnetstat.exe -anob | findstr 3389`r`n`r`n"}
        "Check44"{$buf += "#Check44`r`nhttps://docs.microsoft.com/ja-jp/azure/virtual-machines/windows/prepare-for-upload-vhd-image#install-windows-updates`r`n`r`n"}
        "Check45"{$buf += "#Check45`r`nhttps://docs.microsoft.com/ja-jp/azure/virtual-machines/windows/prepare-for-upload-vhd-image#install-windows-updates`r`n`r`n"}
        default {"Not matched."}
    }
}
$buf | Out-File .\Result\sample.txt 