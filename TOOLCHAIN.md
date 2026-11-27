# Anti-Master-REA Toolchain & Setup Guide

Detailed reference for all GitHub installers, runtimes, and external system tools used in the **Anti-Master-REA** reverse-engineering workflow.

---

## 1. GitHub Repositories, Installers & Runtimes

### REA (Reverse Engineer Anything) Antigravity Installer
- **Repository:** https://github.com/womp08310-cyber/rea-antigravity
- **Installer Script:** https://raw.githubusercontent.com/womp08310-cyber/rea-antigravity/main/install.ps1
- **Setup:**
  ```powershell
  irm https://raw.githubusercontent.com/womp08310-cyber/rea-antigravity/main/install.ps1 | iex
  ```
- **Troubleshooting & Setup Reference:** https://github.com/morluto/rea/discussions/6281

### jdx (Java/Kotlin Analysis & MCP Tool)
- **Releases:** https://github.com/MohammadMD1383/jdx/releases
- **Installer Script:** https://raw.githubusercontent.com/MohammadMD1383/jdx/main/install-release.ps1
- **Setup:**
  ```powershell
  irm https://raw.githubusercontent.com/MohammadMD1383/jdx/main/install-release.ps1 | iex
  ```
- **Usage:** Runs via `jdx.bat` and integrates with MCP for Java/Kotlin symbol, hierarchy, caller, and source inspection.

### JADX CLI (APK Decompiler)
- **Download (v1.5.7):** https://github.com/skylot/jadx/releases/download/v1.5.7/jadx-1.5.7.zip
- **Purpose:** Decompiles Android APK `classes.dex` / `classes2.dex` files into readable Java source code and decoded resources.
- **Example Command:**
  ```powershell
  jadx -d .\decompiled_out .\target_app.apk
  ```

### Adoptium Temurin JDK 25 (and JDK 21)
- **Release Tag:** https://github.com/adoptium/temurin25-binaries/releases/tag/jdk-25.0.5.1
- **Purpose:** Provides the JVM runtime required by **JADX CLI** and **jdx**.

### PCAPdroid MITM & TLS Decryption
- **MITM Addon Repo:** https://github.com/emanuele-f/PCAPdroid-mitm
- **TLS Decryption Docs:** https://emanuele-f.github.io/PCAPdroid/tls_decryption
- **Purpose:** Captures and decrypts Android app HTTPS/TLS network traffic for API endpoint and payload analysis.

---

## 2. External & System Tools

### 1. Node.js LTS & npm
- **Install on Windows:**
  ```powershell
  winget install OpenJS.NodeJS.LTS
  ```
- **Role:** Required runtime for `rea` CLI and Node-based MCP/automation tooling.

### 2. ADB (`adb.exe` — Android SDK Platform-Tools)
- **Role:** Communicates with physical or emulated Android devices over USB/TCP:
  - Device connection & status: `adb devices`
  - Launch target application: `adb shell monkey -p <package_name> -c android.intent.category.LAUNCHER 1`
  - Capture live logs: `adb logcat`
  - Capture screenshots: `adb exec-out screencap -p > screen.png`
  - Inspect system/app state: `adb shell dumpsys` and `adb backup`

### 3. REA CLI (`rea`) & jdx (`jdx.bat`)
- **Role:** Coordinates agentic reverse engineering across binaries, APKs, and decompiled Java/Kotlin codebases.

### 4. PowerShell Utilities
- **Role:** Used on Windows for:
  - Inspecting APK ZIP archives (`Expand-Archive` / `System.IO.Compression.ZipFile`)
  - Searching decompiled sources for API endpoints, keys, and strings (`Select-String`)
  - Testing cryptographic routines (e.g., 3DES / AES payload tests)
  - Serving local inspection dashboards or capture tools (e.g., `start_server.ps1`)

### 5. PCAPdroid
- **Role:** On-device Android packet capture app paired with `PCAPdroid-mitm` for TLS decryption and HTTP/HTTPS inspection without requiring full root in supported setups.

---

## 3. Typical Android Reverse-Engineering Workflow

1. **Prerequisites:** Install **Node.js LTS**, **Temurin JDK 25** (or JDK 21), **ADB**, **JADX v1.5.7**, **rea-antigravity**, and **jdx**.
2. **Pull & Decompile APK:** Extract APK from device via `adb` and decompile `classes.dex` / `classes2.dex` with `jadx`.
3. **Static Analysis:** Load decompiled output into `jdx` / `rea` and search endpoints/crypto routines with PowerShell.
4. **Dynamic & Network Analysis:** Launch the app with `adb`, capture `logcat` + `screencap`, and decrypt HTTPS traffic via **PCAPdroid + PCAPdroid-mitm**.