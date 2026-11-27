# Sync all connected Anti-Master-REA modules
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
Write-Host "All Anti-Master-REA modules are ready!"