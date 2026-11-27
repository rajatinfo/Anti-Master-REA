# Anti-Master-REA

Unified **Master Reverse Engineering Anything (REA)** repository connecting 5 core reverse-engineering projects, installers, and a complete Android/Windows reverse-engineering toolchain.

## 1. Core Connected Repositories

| Module | Repository | Language | Role |
| :--- | :--- | :--- | :--- |
| **Core Engine** | [morluto/rea](https://github.com/morluto/rea) | TypeScript | Reverse engineer anything with agents, from app behavior down to native binaries |
| **Windows & MCP Bridge** | [tonchovet/REA-Windows-Github](https://github.com/tonchovet/REA-Windows-Github) | C++ | REA 6.3.0 binding Hopper & Ghidra through REA MCP, IDA bridge, binary scan & automation |
| **Skills & Prompts** | [smartworldarafath/REA_Skill](https://github.com/smartworldarafath/REA_Skill) | Python | 21 agent skills + 500 prompts for Antigravity, Claude Code, Codex & Cursor |
| **x86 Decompiler** | [DrBellubins/DecompileAnything](https://github.com/DrBellubins/DecompileAnything) | Python | Decompile x86 binaries into byte-matching human-readable source code |
| **Curated Cases** | [AIshihzong/awesome-reverse-engineer-anything](https://github.com/AIshihzong/awesome-reverse-engineer-anything) | Python | Curated AI reverse-engineering cases & open-source rebuild references |

## 2. Companion Repositories, Installers & Runtimes

| Tool / Component | Source / Release | Purpose |
| :--- | :--- | :--- |
| **REA Antigravity Installer** | [womp08310-cyber/rea-antigravity](https://github.com/womp08310-cyber/rea-antigravity) | Windows setup via `install.ps1` |
| **jdx (Java/Kotlin MCP Tool)** | [MohammadMD1383/jdx](https://github.com/MohammadMD1383/jdx/releases) | Java/Kotlin analysis & MCP server via `install-release.ps1` |
| **JADX CLI (v1.5.7)** | [skylot/jadx v1.5.7](https://github.com/skylot/jadx/releases/download/v1.5.7/jadx-1.5.7.zip) | Decompile Android APKs (`classes.dex` / `classes2.dex`) to Java & resources |
| **Adoptium Temurin JDK 25** | [temurin25-binaries (jdk-25.0.5.1)](https://github.com/adoptium/temurin25-binaries/releases/tag/jdk-25.0.5.1) | Java runtime required for JADX and `jdx` |
| **PCAPdroid MITM & TLS Decryption** | [emanuele-f/PCAPdroid-mitm](https://github.com/emanuele-f/PCAPdroid-mitm) · [TLS Guide](https://emanuele-f.github.io/PCAPdroid/tls_decryption) | Android HTTPS/TLS traffic capture & decryption |
| **REA Setup Discussion** | [morluto/rea#6281](https://github.com/morluto/rea/discussions/6281) | Community setup & troubleshooting reference |

## 3. External & System Tools

- **ADB (`adb.exe` / Android SDK Platform-Tools):** Connect to Android devices, launch target apps, capture `logcat` logs, take `screencap` screenshots, and inspect `adb backup` / `dumpsys`.
- **JADX CLI (v1.5.7):** Decompile APK `classes.dex` / `classes2.dex` into readable Java source code and XML resources.
- **REA CLI (`rea`) & `jdx` (`jdx.bat`):** Agent-driven reverse engineering and Java/Kotlin code analysis.
- **Node.js LTS & npm + JDK 21 / JDK 25:** Core runtime dependencies (`winget install OpenJS.NodeJS.LTS` + Temurin JDK).
- **PowerShell:** APK ZIP inspection, API endpoint/string search, cryptographic testing (e.g., 3DES), and local helper web servers.
- **PCAPdroid:** On-device Android network & HTTPS traffic capture.

> See [TOOLCHAIN.md](./TOOLCHAIN.md) for full installation commands, scripts, and step-by-step usage.

## Quick Start

Clone with all connected modules:

```bash
git clone --recursive https://github.com/rajatinfo/Anti-Master-REA.git
cd Anti-Master-REA
```

Or on Windows PowerShell, sync all 5 core modules into `modules/`:

```powershell
.\bootstrap.ps1
```

## Project Structure

- `modules/rea` — Core REA agent framework
- `modules/REA-Windows-Github` — Windows/Hopper/Ghidra/IDA MCP integration
- `modules/REA_Skill` — Agent skills & prompt library
- `modules/DecompileAnything` — x86 binary-to-source decompiler
- `modules/awesome-reverse-engineer-anything` — Case studies & benchmarks
- `TOOLCHAIN.md` — Detailed setup & system tools documentation
- `repos.json` — Machine-readable manifest of connected repositories & tools
- `bootstrap.ps1` — Windows PowerShell module & installer helper