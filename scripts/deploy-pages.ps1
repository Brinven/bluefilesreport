$ErrorActionPreference = "Stop"

$root = Split-Path -Parent $PSScriptRoot
Set-Location $root

$deploy = "_deploy"
if (Test-Path $deploy) { Remove-Item -Recurse -Force $deploy }
New-Item -ItemType Directory -Path $deploy | Out-Null

git ls-files | ForEach-Object {
    $src = $_
    $dst = Join-Path $deploy $src
    $dstDir = Split-Path $dst
    if (-not (Test-Path $dstDir)) { New-Item -ItemType Directory -Path $dstDir -Force | Out-Null }
    Copy-Item -LiteralPath $src -Destination $dst -Force
}

$count = (Get-ChildItem -Recurse $deploy -File).Count
Write-Host "Staged $count files into $deploy/"

$commitHash = git rev-parse HEAD
$commitMsg = git log -1 --pretty=%s

& "node_modules\.bin\wrangler.cmd" pages deploy $deploy `
    --project-name=bluefilesreport `
    --branch=main `
    --commit-hash=$commitHash `
    --commit-message="$commitMsg" `
    --commit-dirty=true

Remove-Item -Recurse -Force $deploy
Write-Host "Cleaned up $deploy/"
