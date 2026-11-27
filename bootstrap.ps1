# Sync all connected Anti-Master-REA modules and optionally install Windows toolchain
param(
    [switch]$InstallToolchain
)

$ErrorActionPreference = "Stop"
if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
    Write-Error "Git is required to clone submodules. Install Git from https://git-scm.com/"
    exit 1
}

New-Item -ItemType Directory -Force -Path "modules" | Out-Null
$repos = @(
    @{ Name = "rea"; Url = "https://github.com/morluto/rea.git" },
    @{ Name = "REA-Windows-Github"; Url = "https://github.com/tonchovet/REA-Windows-Github.git" },
    @{ Name = "REA_Skill"; Url = "https://github.com/smartworldarafath/REA_Skill.git" },
    @{ Name = "DecompileAnything"; Url = "https://github.com/DrBellubins/DecompileAnything.git" },
    @{ Name = "awesome-reverse-engineer-anything"; Url = "https://github.com/AIshihzong/awesome-reverse-engineer-anything.git" }
)

foreach ($r in $repos) {
    $dest = Join-Path "modules" $r.Name
    if (Test-Path $dest) {
        Write-Host "Updating $($r.Name)..."
        git -C $dest pull --ff-only
    } else {
        Write-Host "Cloning $($r.Name)..."
        git clone --depth 1 $r.Url $dest
    }
}

if ($InstallToolchain) {
    Write-Host "Installing Node.js LTS via winget..."
    winget install OpenJS.NodeJS.LTS --accept-package-agreements --accept-source-agreements
    Write-Host "Installing rea-antigravity..."
    irm https://raw.githubusercontent.com/womp08310-cyber/rea-antigravity/main/install.ps1 | iex
    Write-Host "Installing jdx..."
    irm https://raw.githubusercontent.com/MohammadMD1383/jdx/main/install-release.ps1 | iex
    Write-Host "Download JADX v1.5.7 & Temurin JDK 25 from TOOLCHAIN.md links."
}

Write-Host "All Anti-Master-REA modules are ready!"