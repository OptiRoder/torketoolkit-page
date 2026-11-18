# =============================================================================
#  TorkeToolkit - Instalador / Lanzador Rápido de PowerShell
#  irm https://torktoolkit.com/toolkit.ps1 | iex
# =============================================================================

$ErrorActionPreference = 'Stop'
$ProgressPreference = 'SilentlyContinue'
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

$destino = "$env:TEMP\TorkeToolkit"
New-Item -ItemType Directory -Force -Path $destino | Out-Null
$archivoExe = Join-Path $destino "TorkeToolkit.exe"

Write-Host "=========================================================" -ForegroundColor Cyan
Write-Host "   TorkeToolkit - Descargando última edición portable..." -ForegroundColor Cyan
Write-Host "=========================================================" -ForegroundColor Cyan

$dlUrl = "https://github.com/OptiRoder/TorkeToolkit-Suite/releases/latest/download/TorkeToolkit-Portable-v3.2.0.exe"
try {
    $rel = Invoke-RestMethod -Uri "https://api.github.com/repos/OptiRoder/TorkeToolkit-Suite/releases/latest" -Headers @{ "User-Agent" = "TorkeToolkit-Bootstrap" }
    $asset = $rel.assets | Where-Object { $_.name -match 'portable.*\.exe$' } | Select-Object -First 1
    if ($asset -and $asset.browser_download_url) { $dlUrl = $asset.browser_download_url }
} catch {
    try {
        $rel = Invoke-RestMethod -Uri "https://api.github.com/repos/OptiRoder/OptiRoder.github.io/releases/latest" -Headers @{ "User-Agent" = "TorkeToolkit-Bootstrap" }
        $asset = $rel.assets | Where-Object { $_.name -match 'portable.*\.exe$' } | Select-Object -First 1
        if ($asset -and $asset.browser_download_url) { $dlUrl = $asset.browser_download_url }
    } catch {}
}

if (Get-Command "curl.exe" -ErrorAction SilentlyContinue) {
    & curl.exe -fL --retry 3 --progress-bar $dlUrl -o $archivoExe
    if ($LASTEXITCODE -ne 0) { throw "Error descargando TorkeToolkit desde $dlUrl" }
} else {
    Invoke-WebRequest -Uri $dlUrl -OutFile $archivoExe -UseBasicParsing
}
Write-Host "Iniciando TorkeToolkit..." -ForegroundColor Green
Start-Process $archivoExe
