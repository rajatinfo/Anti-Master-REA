# Anti-Master-REA

Unified **Master Reverse Engineering Anything (REA)** repository connecting 5 core reverse-engineering projects, automated installers, Antigravity MCP servers, traffic capture/emulation platforms, and zero-dependency PowerShell inspection/proxy patterns.

## 1. Core Connected Repositories

| Module | Repository | Language | Role |
| :--- | :--- | :--- | :--- |
| **Core Engine** | [morluto/rea](https://github.com/morluto/rea) | TypeScript | Reverse engineer anything with agents, from app behavior down to native binaries |
| **Windows & MCP Bridge** | [tonchovet/REA-Windows-Github](https://github.com/tonchovet/REA-Windows-Github) | C++ | REA 6.3.0 binding Hopper & Ghidra through REA MCP, IDA bridge, binary scan & automation |
| **Skills & Prompts** | [smartworldarafath/REA_Skill](https://github.com/smartworldarafath/REA_Skill) | Python | 21 agent skills + 500 prompts for Antigravity, Claude Code, Codex & Cursor |
| **x86 Decompiler** | [DrBellubins/DecompileAnything](https://github.com/DrBellubins/DecompileAnything) | Python | Decompile x86 binaries into byte-matching human-readable source code |
| **Curated Cases** | [AIshihzong/awesome-reverse-engineer-anything](https://github.com/AIshihzong/awesome-reverse-engineer-anything) | Python | Curated AI reverse-engineering cases & open-source rebuild references |

## 2. Companion Projects, Installers & Runtimes

| Project / Tool | Source / Release | Role |
| :--- | :--- | :--- |
| **REA Antigravity Installer** | [womp08310-cyber/rea-antigravity](https://github.com/womp08310-cyber/rea-antigravity) | Automated installer for `rea-agents`, OpenJDK 21 LTS, NSA Ghidra, JADX Headless MCP & `mcp_config.json` |
| **jdx (Java/Kotlin MCP)** | [MohammadMD1383/jdx](https://github.com/MohammadMD1383/jdx/releases) · [Antigravity Docs](https://mohammadmd1383.github.io/jdx/integrations/antigravity/) | Java & Kotlin bytecode/classpath MCP server (`v1.8.0`) |
| **JADX CLI** | [skylot/jadx v1.5.7](https://github.com/skylot/jadx/releases/download/v1.5.7/jadx-1.5.7.zip) | Full APK decompilation (`classes.dex` / `classes2.dex` to Java & resources) |
| **Adoptium Temurin JDK 25** | [temurin25-binaries (jdk-25.0.5.1)](https://github.com/adoptium/temurin25-binaries/releases/tag/jdk-25.0.5.1) | `JAVA_HOME` runtime for Ghidra `12.2` and JADX CLI |
| **PCAPdroid MITM** | [emanuele-f/PCAPdroid-mitm](https://github.com/emanuele-f/PCAPdroid-mitm) · [TLS Guide](https://emanuele-f.github.io/PCAPdroid/tls_decryption) | TLS/HTTPS decryption addon for PCAPdroid on Android |
| **REA Setup Discussion** | [morluto/rea#6281](https://github.com/morluto/rea/discussions/6281) | Automated installer & skill suite reference discussion |

## 3. Architecture Highlights

- **Local Toolchain & MCP:** `rea-agents` (`6.10.1`), NSA Ghidra (`12.2_PUBLIC`), JADX Headless MCP (`0.7.1`), JADX CLI (`v1.5.7`), `jdx` (`v1.8.0`), OpenJDK 21/25, Node.js LTS, and ADB.
- **Traffic Capture & Cloud Testing:** PCAPdroid + `PCAPdroid-mitm`, MobileNext Cloud Android MCP, Appetize.io browser Android emulator, and Proxyman.
- **Zero-Dependency PowerShell Stack:** `.NET TcpListener` HTTP server, `TripleDESCryptoServiceProvider` (`DESede` / ECB / PKCS7 + `SHA1`) API proxy pattern, and `ZipFile` / binary DEX header inspection scripts.

> See [TOOLCHAIN.md](./TOOLCHAIN.md) for exact versions, paths, Antigravity MCP configuration, cloud testing, and PowerShell implementation patterns.

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
- `TOOLCHAIN.md` — Full toolchain, MCP config, traffic capture & PowerShell stack guide
- `repos.json` — Machine-readable manifest of connected repositories & tools
- `bootstrap.ps1` — Windows PowerShell module & installer helper