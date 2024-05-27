BeforeAll {
    chcp 437 | Out-Null
    . $PSCommandPath.Replace('.Tests.ps1', '.ps1')
}

Describe "Check01" {
    It "No static route settings" {
        [String](Get-NetRoute | Where-Object {($_.Protocol -eq 'NetMgmt') -and ($_.DestinationPrefix -ne '0.0.0.0/0') -and ($_.AddressFamily -eq 'IPv4')}) | Should -BeNullOrEmpty
    }
}
Describe "Check02" {
    It "No WinHTTP proxy settings" {
        [String](netsh winhttp show proxy) | Should -BeLike '*Direct access (no proxy server)*'
    }
}
Describe "Check03" {
    It "SAN policy is Online All" {
        [String](echo san | diskpart) | Should -BeLike '*Online All*'
    }
}
Describe "Check04" {
    It "TimeZoneInformation settings" {
        RegValue 'Registry::HKLM\SYSTEM\CurrentControlSet\Control\TimeZoneInformation' 'RealTimeIsUniversal' | Should -Be '1'
    }
}
Describe "Check05" {
    It "Service automatic start setting (w32time)" {
        ServiceStartType 'w32time' | Should -Be 'Automatic'
    }
}
Describe "Check06" {
    It "High performance power settings" {
        [String](powercfg /getactivescheme) | Should -BeLike '*8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c*'
    }
}
Describe "Check07" {
    It "Environment variable (TEMP)" {
        RegValue 'Registry::HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment' 'TEMP' | Should -Be 'C:\Windows\TEMP'
    }
}
Describe "Check08" {
    It "Environment variable (TMP)" {
        RegValue 'Registry::HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment' 'TMP' | Should -Be 'C:\Windows\TEMP'
    }
}
Describe "Check09" {
    It "Hyper-V Integration Services installation" {
        RegValue 'Registry::HKLM\Software\Microsoft\Virtual Machine\Auto' 'IntegrationServicesVersion' | Should -Not -BeNullOrEmpty
    }
}
Describe "Check10" {
    It "Service automatic start setting (BFE)" {
        ServiceStartType 'BFE' | Should -Be 'Automatic'
    }
    It "Service automatic start setting (Dhcp)" {
        ServiceStartType 'Dhcp' | Should -Be 'Automatic'
    }
    It "Service automatic start setting (Dnscache)" {
        ServiceStartType 'Dnscache' | Should -Be 'Automatic'
    }
    It "Service automatic start setting (IKEEXT)" {
        ServiceStartType 'IKEEXT' | Should -Be 'Automatic'
    }
    It "Service automatic start setting (iphlpsvc)" {
        ServiceStartType 'iphlpsvc' | Should -Be 'Automatic'
    }
    It "Service automatic start setting (nsi)" {
        ServiceStartType 'nsi' | Should -Be 'Automatic'
    }
    It "Service automatic start setting (mpssvc)" {
        ServiceStartType 'mpssvc' | Should -Be 'Automatic'
    }
    It "Service automatic start setting (RemoteRegistry)" {
        ServiceStartType 'RemoteRegistry' | Should -Be 'Automatic'
    }
}
Describe "Check11" {
    It "Service manual start setting (Netlogon)" {
        ServiceStartType 'Netlogon' | Should -Be 'Manual'
    }
    It "Service manual start setting (Netman)" {
        ServiceStartType 'Netman' | Should -Be 'Manual'
    }
    It "Service manual start setting (TermService)" {
        ServiceStartType 'TermService' | Should -Be 'Manual'
    }
}
Describe "Check12" {
    It "Remote desktop enabled" {
        RegValue 'Registry::HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server' 'fDenyTSConnections' | Should -Be '0'
    }
}
Describe "Check13" {
    It "Remote desktop enabled" {
        RegValue 'Registry::HKLM\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services' 'fDenyTSConnections' | Should -Be '0'
    }
}
Describe "Check14" {
    It "Remote desktop port setting" {
        RegValue 'Registry::HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server\Winstations\RDP-Tcp' 'PortNumber' | Should -Be '3389'
    }
}
Describe "Check15" {
    It "Remote desktop lisner setting" {
        RegValue 'Registry::HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server\Winstations\RDP-Tcp' 'LanAdapter' | Should -Be '0'
    }
}
Describe "Check16" {
    It "Remote desktop NLA setting" {
        RegValue 'Registry::HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server\Winstations\RDP-Tcp' 'UserAuthentication' | Should -Be '1'
    }
}
Describe "Check17" {
    It "Remote desktop NLA setting" {
        RegValue 'Registry::HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server\Winstations\RDP-Tcp' 'SecurityLayer' | Should -Be '1'
    }
}
Describe "Check18" {
    It "Remote desktop NLA setting" {
        RegValue 'Registry::HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server\Winstations\RDP-Tcp' 'fAllowSecProtocolNegotiation' | Should -Be '1'
    }
}
Describe "Check19" {
    It "Remote desktop KeepAlive setting" {
        RegValue 'Registry::HKLM\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services' 'KeepAliveEnable' | Should -Be '1'
    }
}
Describe "Check20" {
    It "Remote desktop KeepAlive setting" {
        RegValue 'Registry::HKLM\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services' 'KeepAliveInterval' | Should -Be '1'
    }
}
Describe "Check21" {
    It "Remote desktop KeepAlive setting" {
        RegValue 'Registry::HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server\Winstations\RDP-Tcp' 'KeepAliveTimeout' | Should -Be '1'
    }
}
Describe "Check22" {
    It "Remote desktop reconnect setting" {
        RegValue 'Registry::HKLM\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services' 'fDisableAutoReconnect' | Should -Be '0'
    }
}
Describe "Check23" {
    It "Remote desktop reconnect setting" {
        RegValue 'Registry::HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server\Winstations\RDP-Tcp' 'fInheritReconnectSame' | Should -Be '1'
    }
}
Describe "Check24" {
    It "Remote desktop reconnect setting" {
        RegValue 'Registry::HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server\Winstations\RDP-Tcp' 'fReconnectSame' | Should -Be '0'
    }
}
Describe "Check25" {
    It "Remote desktop max instance count setting" {
        RegValue 'Registry::HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server\Winstations\RDP-Tcp' 'MaxInstanceCount' | Should -Be '4294967295'
    }
}
Describe "Check26" {
    It "Remote desktop self signed certificate" {
        [String]((Get-Item -Path 'Registry::HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp').Property -contains 'SSLCertificateSHA1Hash') | Should -Be 'False'
    }
}
Describe "Check27" {
    It "Firewall profile enabled (Domain)" {
        FilewallProfileEnabled 'Domain' | Should -Be 'True'
    }
    It "Firewall profile enabled (Public)" {
        FilewallProfileEnabled 'Public' | Should -Be 'True'
    }
    It "Firewall profile enabled (Private)" {
        FilewallProfileEnabled 'Private' | Should -Be 'True'
    }
}
Describe "Check28" {
    It "WinRM enabled" {
        ServiceStartType 'WinRM' | Should -Be 'Automatic'
    }
}
Describe "Check29" {
    It "WinRM enabled" {
        [String](winrm e winrm/config/listener) | Should -BeLike '*Address = `**Transport = HTTP*Port = 5985*'
    }
}
Describe "Check30" {
    It "WinRM firewall rule enabled (WINRM-HTTP-In-TCP)" {
        FilewallRuleEnabled 'WINRM-HTTP-In-TCP' | Should -Be 'True'
    }
    It "WinRM firewall rule enabled (WINRM-HTTP-In-TCP-PUBLIC)" {
        FilewallRuleEnabled 'WINRM-HTTP-In-TCP-PUBLIC' | Should -Be 'True'
    }
}
Describe "Check31" {
    It "Remote desktop firewall rule enabled" {
        [String](Get-NetFirewallRule -Group '@FirewallAPI.dll,-28752' | Select -ExpandProperty Enabled) | Should -Not -BeLike '*False*'
    }
}
Describe "Check32" {
    It "File and printer shareg firewall rule enabled" {
        FilewallRuleEnabled 'FPS-ICMP4-ERQ-In' | Should -Be 'True'
    }
}
Describe "Check33" {
    It "Azure platform firewall rule enabled" {
        [String](Get-NetFirewallRule -DisplayName 'AzurePlatform') | Should -Not -BeNullOrEmpty
    }
}
Describe "Check34" {
    It "Kernel dump on an OS crash event" {
        RegValue 'Registry::HKLM\SYSTEM\CurrentControlSet\Control\CrashControl' 'CrashDumpEnabled' | Should -Be '2'
    }
}
Describe "Check35" {
    It "Kernel dump on an OS crash event" {
        RegValue 'Registry::HKLM\SYSTEM\CurrentControlSet\Control\CrashControl' 'DumpFile' | Should -Be 'C:\Windows\MEMORY.DMP'
    }
}
Describe "Check36" {
    It "Kernel dump on an OS crash event" {
        RegValue 'Registry::HKLM\SYSTEM\CurrentControlSet\Control\CrashControl' 'NMICrashDump' | Should -Be '1'
    }
}
Describe "Check37" {
    It "User mode dumps on a service crash event" {
        [String](Test-Path -Path 'HKLM:\SOFTWARE\Microsoft\Windows\Windows Error Reporting\LocalDumps') | Should -Be 'True'
    }
}
Describe "Check38" {
    It "User mode dumps on a service crash event" {
        RegValue 'Registry::HKLM\SOFTWARE\Microsoft\Windows\Windows Error Reporting\LocalDumps' 'DumpFolder' | Should -Be 'C:\CrashDumps'
    }
}
Describe "Check39" {
    It "User mode dumps on a service crash event" {
        RegValue 'Registry::HKLM\SOFTWARE\Microsoft\Windows\Windows Error Reporting\LocalDumps' 'CrashCount' | Should -Be '10'
    }
}
Describe "Check40" {
    It "User mode dumps on a service crash event" {
        RegValue 'Registry::HKLM\SOFTWARE\Microsoft\Windows\Windows Error Reporting\LocalDumps' 'DumpType' | Should -Be '2'
    }
}
Describe "Check41" {
    It "User mode dumps on a service crash event" {
        ServiceStartType 'WerSvc' | Should -Be 'Manual'
    }
}
Describe "Check42" {
    It "WMI repository consistent" {
        [String](winmgmt.exe /verifyrepository) | Should -Be 'WMI repository is consistent'
    }
}
Describe "Check43" {
    It "TCP port 3389 used process" {
        [String](Get-CimInstance CIM_Service | Where-Object {$_.ProcessID -eq (Get-NetTCPConnection -LocalPort 3389)[0].OwningProcess} | Select -ExpandProperty Name) | Should -Be 'TermService'
    }
}
Describe "Check44" {
    $os = (Get-CimInstance -ClassName Win32_OperatingSystem).Version

    switch ($os){
        '6.2.9200'{      # 2012
            It "disk.sys"{FileVersion 'c:\windows\system32\drivers\disk.sys' | Should -BeGreaterOrEqual '6.2.9200.21757'}
            It "storport.sys"{FileVersion 'c:\windows\system32\drivers\storport.sys' | Should -BeGreaterOrEqual '6.2.9200.21306'}
            It "ntfs.sys"{FileVersion 'c:\windows\system32\drivers\ntfs.sys' | Should -BeGreaterOrEqual '6.2.9200.21743'}
            It "Iologmsg.dll"{FileVersion 'c:\windows\system32\Iologmsg.dll' | Should -BeGreaterOrEqual '6.2.9200.16384'}
            It "Classpnp.sys"{FileVersion 'c:\windows\system32\drivers\Classpnp.sys' | Should -BeGreaterOrEqual '6.2.9200.21180'}
            It "Volsnap.sys"{FileVersion 'c:\windows\system32\drivers\Volsnap.sys' | Should -BeGreaterOrEqual '6.2.9200.21165'}
            It "partmgr.sys"{FileVersion 'c:\windows\system32\drivers\partmgr.sys' | Should -BeGreaterOrEqual '6.2.9200.16681'}
            It "Msiscsi.sys"{FileVersion 'c:\windows\system32\drivers\Msiscsi.sys' | Should -BeGreaterOrEqual '6.2.9200.21006'}
            It "Msdsm.sys"{FileVersion 'c:\windows\system32\drivers\Msdsm.sys' | Should -BeGreaterOrEqual '6.2.9200.21474'}
            It "Mpio.sys"{FileVersion 'c:\windows\system32\drivers\Mpio.sys' | Should -BeGreaterOrEqual '6.2.9200.21190'}
            It "vmstorfl.sys"{FileVersion 'c:\windows\system32\drivers\vmstorfl.sys' | Should -BeGreaterOrEqual '6.3.9600.18080'}
            It "Fveapi.dll"{FileVersion 'c:\windows\system32\Fveapi.dll' | Should -BeGreaterOrEqual '6.2.9200.20930'}
            It "Fveapibase.dll"{FileVersion 'c:\windows\system32\Fveapibase.dll' | Should -BeGreaterOrEqual '6.2.9200.20930'}
            It "mrxsmb10.sys"{FileVersion 'c:\windows\system32\drivers\mrxsmb10.sys' | Should -BeGreaterOrEqual '6.2.9200.22108'}
            It "mrxsmb20.sys"{FileVersion 'c:\windows\system32\drivers\mrxsmb20.sys' | Should -BeGreaterOrEqual '6.2.9200.21548'}
            It "mrxsmb.sys"{FileVersion 'c:\windows\system32\drivers\mrxsmb.sys' | Should -BeGreaterOrEqual '6.2.9200.22074'}
            It "tcpip.sys"{FileVersion 'c:\windows\system32\drivers\tcpip.sys' | Should -BeGreaterOrEqual '6.2.9200.22070'}
            It "http.sys"{FileVersion 'c:\windows\system32\drivers\http.sys' | Should -BeGreaterOrEqual '6.2.9200.17285'}
            It "vmswitch.sys"{FileVersion 'c:\windows\system32\drivers\vmswitch.sys' | Should -BeGreaterOrEqual '6.2.9200.22117'}
            It "vmswitch.sys"{FileVersion 'c:\windows\system32\drivers\vmswitch.sys' | Should -BeGreaterOrEqual '6.2.9200.22117'}
            It "ntoskrnl.exe"{FileVersion 'c:\windows\system32\ntoskrnl.exe' | Should -BeGreaterOrEqual '6.2.9200.22170'}
            It "rdpcorets.dll"{FileVersion 'c:\windows\system32\rdpcorets.dll' | Should -BeGreaterOrEqual '6.2.9200.22104'}
            It "termsrv.dll"{FileVersion 'c:\windows\system32\termsrv.dll' | Should -BeGreaterOrEqual '6.2.9200.17048'}
            It "win32k.sys"{FileVersion 'c:\windows\system32\win32k.sys' | Should -BeGreaterOrEqual '6.2.9200.22168 '}
        }
        '6.3.9600'{      # 2012R2
            It "disk.sys"{FileVersion 'c:\windows\system32\drivers\disk.sys' | Should -BeGreaterOrEqual '6.3.9600.18203'}
            It "storport.sys"{FileVersion 'c:\windows\system32\drivers\storport.sys' | Should -BeGreaterOrEqual '6.3.9600.18573'}
            It "ntfs.sys"{FileVersion 'c:\windows\system32\drivers\ntfs.sys' | Should -BeGreaterOrEqual '6.3.9600.18654'}
            It "Classpnp.sys"{FileVersion 'c:\windows\system32\drivers\Classpnp.sys' | Should -BeGreaterOrEqual '6.3.9600.18334'}
            It "Volsnap.sys"{FileVersion 'c:\windows\system32\drivers\Volsnap.sys' | Should -BeGreaterOrEqual '6.3.9600.18265'}
            It "partmgr.sys"{FileVersion 'c:\windows\system32\drivers\partmgr.sys' | Should -BeGreaterOrEqual '6.3.9600.17401'}
            It "Msiscsi.sys"{FileVersion 'c:\windows\system32\drivers\Msiscsi.sys' | Should -BeGreaterOrEqual '6.3.9600.18624'}
            It "Msdsm.sys"{FileVersion 'c:\windows\system32\drivers\Msdsm.sys' | Should -BeGreaterOrEqual '6.3.9600.18592'}
            It "Mpio.sys"{FileVersion 'c:\windows\system32\drivers\Mpio.sys' | Should -BeGreaterOrEqual '6.3.9600.18616'}
            It "vmstorfl.sys"{FileVersion 'c:\windows\system32\drivers\vmstorfl.sys' | Should -BeGreaterOrEqual '6.3.9600.18907'}
            It "Fveapi.dll"{FileVersion 'c:\windows\system32\Fveapi.dll' | Should -BeGreaterOrEqual '6.3.9600.18294'}
            It "Fveapibase.dll"{FileVersion 'c:\windows\system32\Fveapibase.dll' | Should -BeGreaterOrEqual '6.3.9600.17415'}
            It "mrxsmb10.sys"{FileVersion 'c:\windows\system32\drivers\mrxsmb10.sys' | Should -BeGreaterOrEqual '6.3.9600.18603'}
            It "mrxsmb20.sys"{FileVersion 'c:\windows\system32\drivers\mrxsmb20.sys' | Should -BeGreaterOrEqual '6.3.9600.18586'}
            It "mrxsmb.sys"{FileVersion 'c:\windows\system32\drivers\mrxsmb.sys' | Should -BeGreaterOrEqual '6.3.9600.18586'}
            It "tcpip.sys"{FileVersion 'c:\windows\system32\drivers\tcpip.sys' | Should -BeGreaterOrEqual '6.3.9600.18478'}
            It "http.sys"{FileVersion 'c:\windows\system32\drivers\http.sys' | Should -BeGreaterOrEqual '6.3.9600.18574'}
            It "vmswitch.sys"{FileVersion 'c:\windows\system32\drivers\vmswitch.sys' | Should -BeGreaterOrEqual '6.3.9600.18654'}
            It "ntoskrnl.exe"{FileVersion 'c:\windows\system32\ntoskrnl.exe' | Should -BeGreaterOrEqual '6.3.9600.18696'}
            It "rdpcorets.dll"{FileVersion 'c:\windows\system32\rdpcorets.dll' | Should -BeGreaterOrEqual '6.3.9600.18619'}
            It "termsrv.dll"{FileVersion 'c:\windows\system32\termsrv.dll' | Should -BeGreaterOrEqual '6.3.9600.17415'}
            It "win32k.sys"{FileVersion 'c:\windows\system32\win32k.sys' | Should -BeGreaterOrEqual '6.3.9600.18698'}
        }
        '10.0.14393'{    # 2016
            It "storport.sys"{FileVersion 'c:\windows\system32\drivers\storport.sys' | Should -BeGreaterOrEqual '10.0.14393.1358'}
            It "ntfs.sys"{FileVersion 'c:\windows\system32\drivers\ntfs.sys' | Should -BeGreaterOrEqual '10.0.14393.1198'}
            It "Classpnp.sys"{FileVersion 'c:\windows\system32\drivers\Classpnp.sys' | Should -BeGreaterOrEqual '10.0.14393.953'}
            It "partmgr.sys"{ FileVersion 'c:\windows\system32\drivers\partmgr.sys' | Should -BeGreaterOrEqual '10.0.14393.953'}
            It "Msiscsi.sys"{FileVersion 'c:\windows\system32\drivers\Msiscsi.sys' | Should -BeGreaterOrEqual '10.0.14393.1066'}
            It "Mpio.sys"{FileVersion 'c:\windows\system32\drivers\Mpio.sys' | Should -BeGreaterOrEqual '10.0.14393.1198'}
            It "vmstorfl.sys"{FileVersion 'c:\windows\system32\drivers\vmstorfl.sys' | Should -BeGreaterOrEqual '10.0.14393.2007'}
            It "Fveapi.dll"{FileVersion 'c:\windows\system32\Fveapi.dll' | Should -BeGreaterOrEqual '10.0.14393.576'}
            It "Fveapibase.dll"{FileVersion 'c:\windows\system32\Fveapibase.dll' | Should -BeGreaterOrEqual '10.0.14393.206'}
            It "netvsc.sys"{FileVersion 'c:\windows\system32\drivers\netvsc.sys' | Should -BeGreaterOrEqual '10.0.14393.1198'}
            It "mrxsmb10.sys"{FileVersion 'c:\windows\system32\drivers\mrxsmb10.sys' | Should -BeGreaterOrEqual '10.0.14393.479'}
            It "mrxsmb20.sys"{FileVersion 'c:\windows\system32\drivers\mrxsmb20.sys' | Should -BeGreaterOrEqual '10.0.14393.953'}
            It "mrxsmb.sys"{FileVersion 'c:\windows\system32\drivers\mrxsmb.sys' | Should -BeGreaterOrEqual '10.0.14393.953'}
            It "tcpip.sys"{FileVersion 'c:\windows\system32\drivers\tcpip.sys' | Should -BeGreaterOrEqual '10.0.14393.1358'}
            It "http.sys"{FileVersion 'c:\windows\system32\drivers\http.sys' | Should -BeGreaterOrEqual '10.0.14393.251'}
            It "vmswitch.sys"{FileVersion 'c:\windows\system32\drivers\vmswitch.sys' | Should -BeGreaterOrEqual '10.0.14393.1358'}
            It "ntoskrnl.exe"{FileVersion 'c:\windows\system32\ntoskrnl.exe' | Should -BeGreaterOrEqual '10.0.14393.1198'}
            It "rdpcorets.dll"{FileVersion 'c:\windows\system32\rdpcorets.dll' | Should -BeGreaterOrEqual '10.0.14393.1198'}
            It "termsrv.dll"{FileVersion 'c:\windows\system32\termsrv.dll' | Should -BeGreaterOrEqual '10.0.14393.0'}
            It "win32k.sys"{FileVersion 'c:\windows\system32\win32k.sys' | Should -BeGreaterOrEqual '10.0.14393.594'}
        }
        default{
            It "No Check"{$True | Should -Be $True}
        }
    }
}

Describe "Check45" {
    $os = (Get-CimInstance -ClassName Win32_OperatingSystem).Version

    switch ($os){
        '6.2.9200'{      # 2012
            It "MS17-010"{
                # https://msrc.microsoft.com/update-guide/vulnerability/CVE-2017-0147
                #HotFixInstalled 'KB4012213,KB4012216,KB4012214,KB4012217' | Should -Not -BeNullOrEmpty

                #https://support.microsoft.com/en-us/topic/how-to-verify-that-ms17-010-is-installed-f55d3f13-7a9c-688c-260b-477d0ec9f2c8
                FileVersion 'c:\windows\system32\drivers\srv.sys' | Should -BeGreaterOrEqual '6.2.9200.22099'
            }
            It "CVE-2018-0886"{
                # https://msrc.microsoft.com/update-guide/vulnerability/CVE-2018-0886
                #HotFixInstalled 'KB4103726,KB4103730' | Should -Not -BeNullOrEmpty

                #https://docs.microsoft.com/en-us/troubleshoot/azure/virtual-machines/credssp-encryption-oracle-remediation#how-to-verify-that-the-credssp-update-is-installe
                FileVersion 'c:\windows\system32\TSpkg.dll' | Should -BeGreaterOrEqual '6.2.9200.22432'
            }
        }
        '6.3.9600'{      # 2012R2
            It "MS17-010"{
                # https://msrc.microsoft.com/update-guide/vulnerability/CVE-2017-0147
                #HotFixInstalled 'KB4012213,KB4012216' | Should -Not -BeNullOrEmpty

                #https://support.microsoft.com/en-us/topic/how-to-verify-that-ms17-010-is-installed-f55d3f13-7a9c-688c-260b-477d0ec9f2c8
                FileVersion 'c:\windows\system32\drivers\srv.sys' | Should -BeGreaterOrEqual '6.3.9600.18604'
            }
            It "CVE-2018-0886"{
                # https://msrc.microsoft.com/update-guide/vulnerability/CVE-2018-0886
                #HotFixInstalled 'KB4103715,KB4103725' | Should -Not -BeNullOrEmpty         

                #https://docs.microsoft.com/en-us/troubleshoot/azure/virtual-machines/credssp-encryption-oracle-remediation#how-to-verify-that-the-credssp-update-is-installe  
                FileVersion 'c:\windows\system32\TSpkg.dll' | Should -BeGreaterOrEqual '6.3.9600.18999'
            }
        }
        '10.0.14393'{    # 2016
            It "MS17-010"{
                # https://msrc.microsoft.com/update-guide/vulnerability/CVE-2017-0147
                #HotFixInstalled 'KB4012606,KB4013198,KB4013429' | Should -Not -BeNullOrEmpty
                
                #https://support.microsoft.com/en-us/topic/how-to-verify-that-ms17-010-is-installed-f55d3f13-7a9c-688c-260b-477d0ec9f2c8
                FileVersion 'c:\windows\system32\drivers\srv.sys' | Should -BeGreaterOrEqual '10.0.14393.953'
            }
            It "CVE-2018-0886"{
                # https://msrc.microsoft.com/update-guide/vulnerability/CVE-2018-0886
                #HotFixInstalled 'KB4103723' | Should -Not -BeNullOrEmpty

                #https://docs.microsoft.com/en-us/troubleshoot/azure/virtual-machines/credssp-encryption-oracle-remediation#how-to-verify-that-the-credssp-update-is-installed
                FileVersion 'c:\windows\system32\TSpkg.dll' | Should -BeGreaterOrEqual '10.0.14393.2248' 
            }
        }
        default{
            It "No Check"{$True | Should -Be $True}
        }
    }
}