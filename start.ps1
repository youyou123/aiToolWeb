# Local preview server for ai-tools-monetize
$port = 8080
$root = Join-Path $PSScriptRoot "site"
$url = "http://localhost:$port"

Write-Host "Starting local server at $url" -ForegroundColor Cyan
Write-Host "Press Ctrl+C to stop" -ForegroundColor Gray

Start-Process $url
Set-Location $root
python -m http.server $port
