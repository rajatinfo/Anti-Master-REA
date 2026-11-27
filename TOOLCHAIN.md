# Anti-Master-REA Toolchain, MCP & Reverse-Engineering Guide

Comprehensive reference for the GitHub projects, local reverse-engineering toolchain, Antigravity MCP setup, traffic capture/emulation platforms, and PowerShell automation patterns used in **Anti-Master-REA**.

---

## 1. GitHub Repositories & Open-Source Projects

| Project / Repo | URL | Role |
| :--- | :--- | :--- |
| **womp08310-cyber/rea-antigravity** | https://github.com/womp08310-cyber/rea-antigravity | One-command automated Windows/macOS/Linux installer for REA (`rea-agents`), portable OpenJDK 21 LTS, NSA Ghidra, JADX Headless MCP, and Antigravity `mcp_config.json` setup. |
| **REA Installer Script (`install.ps1`)** | https://raw.githubusercontent.com/womp08310-cyber/rea-antigravity/main/install.ps1 | PowerShell installer script to bootstrap the reverse-engineering toolchain. |
| **morluto/rea (Discussion #6281)** | https://github.com/morluto/rea/discussions/6281 | Reference discussion for the Antigravity + REA automated installer & skill suite. |
| **MohammadMD1383/jdx** | https://github.com/MohammadMD1383/jdx/releases | Java & Kotlin bytecode/classpath MCP server (`jdx v1.8.0`) for navigating decompiled code and JARs. |
| **jdx Antigravity Docs & Installer** | https://mohammadmd1383.github.io/jdx/integrations/antigravity/ | Documentation and `install-release.ps1` (https://raw.githubusercontent.com/MohammadMD1383/jdx/main/install-release.ps1) used to install `jdx`. |
| **JADX CLI** | https://github.com/skylot/jadx/releases/download/v1.5.7/jadx-1.5.7.zip | Standalone JADX CLI `v1.5.7` for full APK decompilation. |
| **Adoptium Temurin JDK 25** | https://github.com/adoptium/temurin25-binaries/releases/tag/jdk-25.0.5.1 | OpenJDK 25 LTS binaries for Ghidra `12.2` and JADX CLI. |
| **emanuele-f/PCAPdroid-mitm** | https://github.com/emanuele-f/PCAPdroid-mitm | TLS/HTTPS decryption addon for **PCAPdroid** (see [TLS Guide](https://emanuele-f.github.io/PCAPdroid/tls_decryption)) to capture decrypted HTTPS requests, headers, and payloads. |

---

## 2. Local Reverse-Engineering & Development Toolchain

| Tool / Runtime | Version | Typical Windows Install Path | Purpose |
| :--- | :--- | :--- | :--- |
| **Node.js & npm** | `v26.13.1` / `11.20.0` | `C:\Program Files\nodejs\` (via `winget install OpenJS.NodeJS.LTS`) | Runtime for `rea-agents` CLI and MCP server. |
| **REA Agents (`rea-agents`)** | `6.10.1` | `%APPDATA%\npm\node_modules\rea-agents\scripts\rea.mjs` | Reverse Engineer Anything CLI & MCP server (`rea`). |
| **OpenJDK 21 LTS** | `21.0.13.1+2` | `%USERPROFILE%\.antigravity-tools\jdk-21\jdk-21.0.13.1+2` | Portable Adoptium Temurin JDK required by `jdx` and analysis tools. |
| **OpenJDK 25 LTS (`JAVA_HOME`)** | `25.0.5.1+2` | `%USERPROFILE%\.antigravity-tools\jdk-25\jdk-25.0.5.1+2` | JDK configured for Ghidra `12.2` and JADX CLI. |
| **NSA Ghidra** | `12.2_PUBLIC` | `%USERPROFILE%\.antigravity-tools\ghidra\ghidra_12.2_PUBLIC` | Native binary disassembly & decompilation (`analyzeHeadless.bat`). |
| **JADX Headless MCP** | `0.7.1` | `%USERPROFILE%\.antigravity-tools\jadx\jadx-headless-mcp-0.7.1-all.jar` | Headless JADX MCP bridge for REA. |
| **JADX CLI** | `v1.5.7` | `%USERPROFILE%\.antigravity-tools\jadx-cli\bin\jadx.bat` | Full APK decompilation (`classes.dex` / `classes2.dex` to Java & resources). |
| **jdx CLI / MCP** | `v1.8.0` | `%LOCALAPPDATA%\Programs\jdx\jdx.bat` | Java/Kotlin MCP server (`jdx mcp`) for class/method inspection. |
| **Android Platform Tools (ADB)** | SDK `platform-tools` | `%LOCALAPPDATA%\Android\Sdk\platform-tools\adb.exe` | USB debugging on Android devices: `logcat`, `screencap`, `dumpsys`, `adb backup`, and device ID inspection. |

### Antigravity MCP Servers (`%USERPROFILE%\.gemini\config\mcp_config.json`)
- **`rea`**: `node.exe` running `rea.mjs mcp` with `GHIDRA_INSTALL_DIR`, `JAVA_HOME`, and `REA_JADX_MCP_JAR` configured.
- **`jdx`**: `jdx mcp` for Java/Kotlin symbol, hierarchy, caller, and source inspection.

---

## 3. Traffic Capture, Emulation & Cloud Testing Tools

| Tool / Platform | Type | Usage Pattern |
| :--- | :--- | :--- |
| **PCAPdroid + PCAPdroid-mitm** | Android Network Monitor | Captures live app HTTPS/TLS traffic on Android; exports `.xlsx` / `.csv` logs for endpoint and flow analysis. |
| **MobileNext** (https://app.mobilenext.ai/mcp) | Cloud Android MCP | Tests APKs on cloud Android devices via JSON-RPC MCP scripts (e.g., automated UI & state capture). |
| **Appetize.io** | Browser Android Emulator | Runs APKs in a browser-based Android emulator for quick UI/flow inspection and reference screenshots. |
| **Proxyman** | Desktop HTTPS Proxy | Wi-Fi proxy capture on port `9090` (certificate setup via `http://proxy.man/ssl`). |
| **HTTP Toolkit** | Desktop HTTPS Proxy | Alternative desktop HTTPS proxy (note: may have compatibility issues on some local Windows/Android setups). |

---

## 4. Built-in Tech Stack & Custom PowerShell Patterns

- **Zero-Dependency PowerShell HTTP & Crypto Proxy (`start_server.ps1` + `start_server.bat`):**
  - Uses `.NET` `System.Net.Sockets.TcpListener` (no admin rights, Node.js, or Python needed) to serve static files on `http://127.0.0.1:8080/` with fallback ports `8081, 8082, 3000, 5000, 8888`.
  - Supports custom API proxy endpoints using `System.Security.Cryptography.TripleDESCryptoServiceProvider` (`DESede`, `ECB`, `PKCS7`) with `SHA1` key derivation to mirror mobile app encryption routines.
  - Exposes local device-info mock/replay endpoints (e.g., `androidID`, `icc_id`, `mac`, `appVersion`) for local web/API testing.
- **PowerShell DEX & APK Inspection Scripts:**
  - Uses `System.IO.Compression.ZipFile` and binary DEX header parsing to extract `AndroidManifest.xml`, `assets/*.json`, Retrofit endpoints, and POJO fields even before running full JADX CLI decompilation.