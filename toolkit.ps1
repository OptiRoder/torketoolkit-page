# =============================================================================
#  TorkeToolkit - Instalador / Lanzador Rápido de PowerShell
#  irm https://optiroder.github.io/toolkit.ps1 | iex
# =============================================================================

$ErrorActionPreference = 'Stop'
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

$destino = "$env:TEMP\TorkeToolkit"
New-Item -ItemType Directory -Force -Path $destino | Out-Null
$archivoExe = Join-Path $destino "TorkeToolkit.exe"

Write-Host "=========================================================" -ForegroundColor Cyan
Write-Host "   TorkeToolkit - Descargando última edición portable..." -ForegroundColor Cyan
Write-Host "=========================================================" -ForegroundColor Cyan

$dlUrl = "https://github.com/OptiRoder/OptiRoder.github.io/releases/latest/download/TorkeToolkit-Portable-v3.1.0.exe"
try {
    $rel = Invoke-RestMethod -Uri "https://api.github.com/repos/OptiRoder/OptiRoder.github.io/releases/latest" -Headers @{ "User-Agent" = "TorkeToolkit-Bootstrap" }
    $asset = $rel.assets | Where-Object { $_.name -match 'portable.*\.exe$' } | Select-Object -First 1
    if ($asset -and $asset.browser_download_url) { $dlUrl = $asset.browser_download_url }
} catch {}

Invoke-WebRequest -Uri $dlUrl -OutFile $archivoExe
Write-Host "Iniciando TorkeToolkit..." -ForegroundColor Green
Start-Process $archivoExe
