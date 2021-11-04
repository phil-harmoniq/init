$Prompt = "oh-my-posh --init --shell pwsh --config $HOME\OneDrive\Dev\PoshConfig.ps1 | Invoke-Expression"

winget install JanDeDobbeleer.OhMyPosh --accept-package-agreements
New-Item -Path $Profile -Type file
$Prompt | Set-Content -Path $Profile
