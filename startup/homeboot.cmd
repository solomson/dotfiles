cd C:\appl\repos\dotfiles
git pull

copy ".\startup\profile.ps1" "C:\Windows\System32\WindowsPowerShell\v1.0\Profile.ps1" /Y
copy ".\startup\profiles.json" "%LOCALAPPDATA%\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\profiles.json" /Y

.\startup\keybinds.ahk

exit