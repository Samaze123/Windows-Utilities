$ts = Get-Date -Format 'yyyyMMdd_HHmmss'
reg export "HKCU\Keyboard Layout" "$env:TEMP\kbdlayout_backup_$ts.reg" | Out-Null
Add-Type -Namespace Win32 -Name Kbd -MemberDefinition @"
  [System.Runtime.InteropServices.DllImport("user32.dll")]
  public static extern System.IntPtr GetKeyboardLayout(uint idThread);
"@
$hkl = [Win32.Kbd]::GetKeyboardLayout(0)
$keepKlid = ('{0:x8}' -f ($hkl.ToInt64() -band 0xFFFF)).ToUpper()
Write-Host "Keeping KLID $keepKlid"
$preloadPath = 'HKCU:\Keyboard Layout\Preload'
if (-not (Test-Path $preloadPath)) { New-Item -Path $preloadPath -Force | Out-Null }
(Get-Item $preloadPath).GetValueNames() | ForEach-Object {
  if ($_ -ne '1') { Remove-ItemProperty -Path $preloadPath -Name $_ -ErrorAction SilentlyContinue }
}
Set-ItemProperty -Path $preloadPath -Name '1' -Value $keepKlid
$subsPath = 'HKCU:\Keyboard Layout\Substitutes'
if (Test-Path $subsPath) {
  (Get-Item $subsPath).GetValueNames() | ForEach-Object {
    if ($_ -ne $keepKlid) { Remove-ItemProperty -Path $subsPath -Name $_ -ErrorAction SilentlyContinue }
  }
}
$intlPath = 'HKCU:\Control Panel\International\User Profile'
if (-not (Test-Path $intlPath)) { New-Item -Path $intlPath -Force | Out-Null }
$tip = "*:$keepKlid"
New-ItemProperty -Path $intlPath -Name 'InputMethodOverride' -PropertyType String -Value $tip -Force | Out-Null
Get-Process ctfmon -ErrorAction SilentlyContinue | Stop-Process -Force -ErrorAction SilentlyContinue
Start-Process "$env:WinDir\System32\ctfmon.exe"
Write-Host "Done. Sign out/in if the fly-out still shows old entries."