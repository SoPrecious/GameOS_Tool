@echo off
echo [INFO] Starting Post Logon Setup [%date% %time%] >> C:\Windows\installation.log

:: BCD, Firewall, Power, Account Settings
bcdedit.exe /set {current} description "GameOS" >> C:\Windows\installation.log 2>&1
netsh.exe advfirewall set allprofiles state off >> C:\Windows\installation.log 2>&1
powercfg.exe /hibernate off >> C:\Windows\installation.log 2>&1
net.exe accounts /maxpwage:unlimited >> C:\Windows\installation.log 2>&1

:: Telemetry & Feeds Policies
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v "DisableLogonBackgroundImage" /t REG_DWORD /d 1 /f >> C:\Windows\installation.log 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d 0 /f >> C:\Windows\installation.log 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Dsh" /v "AllowNewsAndInterests" /t REG_DWORD /d 0 /f >> C:\Windows\installation.log 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Feeds" /v "EnableFeeds" /t REG_DWORD /d 0 /f >> C:\Windows\installation.log 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Feeds" /v "ShellFeedsTaskbarViewMode" /t REG_DWORD /d 2 /f >> C:\Windows\installation.log 2>&1
reg add "HKU\.DEFAULT\Software\Microsoft\Windows\CurrentVersion\Feeds" /v "ShellFeedsTaskbarViewMode" /t REG_DWORD /d 2 /f >> C:\Windows\installation.log 2>&1

:: Shell Extensions Blocking (64-bit and 32-bit)
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Shell Extensions\Blocked" /v "{1d27f844-3a1f-4410-85ac-14651078412d}" /t REG_SZ /d " " /f >> C:\Windows\installation.log 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Shell Extensions\Blocked" /v "{CA6CC9F1-867A-481E-951E-A28C5E4F01EA}" /t REG_SZ /d "" /f >> C:\Windows\installation.log 2>&1
reg add "HKLM\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Shell Extensions\Blocked" /v "{1d27f844-3a1f-4410-85ac-14651078412d}" /t REG_SZ /d " " /f >> C:\Windows\installation.log 2>&1
reg add "HKLM\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Shell Extensions\Blocked" /v "{CA6CC9F1-867A-481E-951E-A28C5E4F01EA}" /t REG_SZ /d "" /f >> C:\Windows\installation.log 2>&1

:: Windows Update Pause to 2099
reg add "HKLM\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings" /v "PauseUpdatesStartTime" /t REG_SZ /d "2026-07-12T00:00:00Z" /f >> C:\Windows\installation.log 2>&1
reg add "HKLM\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings" /v "PauseUpdatesExpiryTime" /t REG_SZ /d "2099-12-31T23:59:59Z" /f >> C:\Windows\installation.log 2>&1
reg add "HKLM\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings" /v "PauseFeatureUpdatesStartTime" /t REG_SZ /d "2026-07-12T00:00:00Z" /f >> C:\Windows\installation.log 2>&1
reg add "HKLM\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings" /v "PauseFeatureUpdatesExpiryTime" /t REG_SZ /d "2099-12-31T23:59:59Z" /f >> C:\Windows\installation.log 2>&1
reg add "HKLM\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings" /v "PauseQualityUpdatesStartTime" /t REG_SZ /d "2026-07-12T00:00:00Z" /f >> C:\Windows\installation.log 2>&1
reg add "HKLM\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings" /v "PauseQualityUpdatesExpiryTime" /t REG_SZ /d "2099-12-31T23:59:59Z" /f >> C:\Windows\installation.log 2>&1

:: Keyboard Layout & Turkish Q Setup
reg add "HKCU\Keyboard Layout\Toggle" /v "Hotkey" /t REG_SZ /d "3" /f >> C:\Windows\installation.log 2>&1
reg add "HKCU\Keyboard Layout\Toggle" /v "Language Hotkey" /t REG_SZ /d "3" /f >> C:\Windows\installation.log 2>&1
reg add "HKCU\Keyboard Layout\Toggle" /v "Layout Hotkey" /t REG_SZ /d "3" /f >> C:\Windows\installation.log 2>&1
reg add "HKCU\Control Panel\International\User Profile" /v "DefaultInputMethodOverride" /t REG_SZ /d "0409:0000041f" /f >> C:\Windows\installation.log 2>&1
reg add "HKCU\Keyboard Layout\Substitutes" /v "00000409" /t REG_SZ /d "0000041f" /f >> C:\Windows\installation.log 2>&1
reg delete "HKCU\Keyboard Layout\Preload" /f >> C:\Windows\installation.log 2>&1
reg add "HKCU\Keyboard Layout\Preload" /v "1" /t REG_SZ /d "0000041f" /f >> C:\Windows\installation.log 2>&1

:: PowerShell Language Setup
powershell.exe -NoProfile -ExecutionPolicy Bypass -Command "$ProgressPreference = 'SilentlyContinue'; try { $List = New-WinUserLanguageList -Language 'en-US'; $List[0].InputMethodTips.Clear(); $List[0].InputMethodTips.Add('0409:0000041f'); Set-WinUserLanguageList -LanguageList $List -Force; Set-WinDefaultInputMethodOverride -InputTip '0409:0000041f' } catch {}" >> C:\Windows\installation.log 2>&1

:: UI Tweaks
reg add "HKCU\Software\Microsoft\Multimedia\Audio" /v "UserDuckingPreference" /t REG_DWORD /d 3 /f >> C:\Windows\installation.log 2>&1
reg add "HKCU\Software\Policies\Microsoft\Windows\Explorer" /v "DisableNotificationCenter" /t REG_DWORD /d 1 /f >> C:\Windows\installation.log 2>&1
reg add "HKCU\Software\Policies\Microsoft\Windows" /v "TurnOffWindowsCopilot" /t REG_DWORD /d 1 /f >> C:\Windows\installation.log 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "EnableTransparency" /t REG_DWORD /d 0 /f >> C:\Windows\installation.log 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v "CertificateRevocation" /t REG_DWORD /d 0 /f >> C:\Windows\installation.log 2>&1

:: Visual Effects & DWM
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v "VisualFXSetting" /t REG_DWORD /d 3 /f >> C:\Windows\installation.log 2>&1
reg add "HKCU\Control Panel\Desktop" /v "DragFullWindows" /t REG_SZ /d "1" /f >> C:\Windows\installation.log 2>&1
reg add "HKCU\Control Panel\Desktop\WindowMetrics" /v "MinAnimate" /t REG_SZ /d "0" /f >> C:\Windows\installation.log 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "IconsOnly" /t REG_DWORD /d 0 /f >> C:\Windows\installation.log 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ListviewAlphaSelect" /t REG_DWORD /d 0 /f >> C:\Windows\installation.log 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ListviewShadow" /t REG_DWORD /d 0 /f >> C:\Windows\installation.log 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarAnimations" /t REG_DWORD /d 0 /f >> C:\Windows\installation.log 2>&1
reg add "HKCU\Software\Microsoft\Windows\DWM" /v "AlwaysHibernateThumbnails" /t REG_DWORD /d 0 /f >> C:\Windows\installation.log 2>&1
reg add "HKCU\Software\Microsoft\Windows\DWM" /v "EnableAeroPeek" /t REG_DWORD /d 0 /f >> C:\Windows\installation.log 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarWidgets" /t REG_DWORD /d 0 /f >> C:\Windows\installation.log 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\PushNotifications" /v "ToastEnabled" /t REG_DWORD /d 0 /f >> C:\Windows\installation.log 2>&1

:: Win11 Classic Context Menu
reg add "HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32" /ve /t REG_SZ /d "" /f >> C:\Windows\installation.log 2>&1

:: Background App Privacy Policies
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" /v "LetAppsRunInBackground" /t REG_DWORD /d 2 /f >> C:\Windows\installation.log 2>&1

:: Disable Administrative Sharing & Shared Folder Overlays
reg add "HKLM\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" /v "AutoShareWks" /t REG_DWORD /d 0 /f >> C:\Windows\installation.log 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" /v "AutoShareServer" /t REG_DWORD /d 0 /f >> C:\Windows\installation.log 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "SharingWizardOn" /t REG_DWORD /d 0 /f >> C:\Windows\installation.log 2>&1

:: Shutdown timeout policies
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "MaxGPOScriptWait" /t REG_DWORD /d 300 /f >> C:\Windows\installation.log 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control" /v "WaitToKillServiceTimeout" /t REG_SZ /d "20000" /f >> C:\Windows\installation.log 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager" /v "AutoEndTasks" /t REG_SZ /d "0" /f >> C:\Windows\installation.log 2>&1

:: Edge Cleanup
sc.exe stop edgeupdate >> C:\Windows\installation.log 2>&1
sc.exe delete edgeupdate >> C:\Windows\installation.log 2>&1
sc.exe stop edgeupdatem >> C:\Windows\installation.log 2>&1
sc.exe delete edgeupdatem >> C:\Windows\installation.log 2>&1

powershell.exe -NoProfile -ExecutionPolicy Bypass -Command "Set-WinHomeLocation -GeoID 235 -ErrorAction SilentlyContinue; Get-LocalUser -ErrorAction SilentlyContinue | Set-LocalUser -PasswordNeverExpires $true -ErrorAction SilentlyContinue; Get-ScheduledTask -ErrorAction SilentlyContinue | Where-Object { $_.TaskName -like '*MicrosoftEdge*' -or $_.TaskName -like '*EdgeUpdate*' } | Unregister-ScheduledTask -Confirm:$false -ErrorAction SilentlyContinue" >> C:\Windows\installation.log 2>&1

:: GameOS Markers
reg add "HKLM\SOFTWARE\GameOS" /v "Installed" /t REG_DWORD /d 1 /f >> C:\Windows\installation.log 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v "RegisteredOwner" /t REG_SZ /d "GameOS" /f >> C:\Windows\installation.log 2>&1

echo [INFO] Post Logon Setup completed successfully [%date% %time%] >> C:\Windows\installation.log
