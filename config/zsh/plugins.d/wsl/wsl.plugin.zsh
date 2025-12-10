alias c='/mnt/c/WINDOWS/system32/clip.exe'
alias o='/mnt/c/WINDOWS/explorer.exe .'
alias wsl='/mnt/c/Program\ Files/WSL/wsl.exe'

path=(
    $path
    "/mnt/c/Windows/System32/WindowsPowerShell/v1.0"
    "/mnt/c/Users/adg/AppData/Local/Programs/Microsoft VS Code/bin"
    "${HOME}/.local/bin"
)

(wsl -d debian-store -u root service nix-daemon status 2>&1 >/dev/null ) || wsl -d debian-store -u root service nix-daemon start