$Prompt = 'oh-my-posh --init --shell pwsh --config ~\git\init\oh-my-posh\blueish-custom.omp.json | Invoke-Expression'

winget install JanDeDobbeleer.OhMyPosh --accept-package-agreements
New-Item -Path $Profile -Type file
$Prompt | Set-Content -Path $Profile
