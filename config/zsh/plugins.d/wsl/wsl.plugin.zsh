alias c='/mnt/c/WINDOWS/system32/clip.exe'
alias o='/mnt/c/WINDOWS/explorer.exe .'

path=(
    $path
    "/mnt/c/Windows/System32/WindowsPowerShell/v1.0"
    "/mnt/c/Users/adg/AppData/Local/Programs/Microsoft VS Code/bin"
    "${HOME}/.local/bin"
)

(wsl -d trixie -u root service nix-daemon status 2>&1 >/dev/null ) || wsl -d trixie -u root service nix-daemon start