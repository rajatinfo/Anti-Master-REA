# Anti-Master-REA

Unified **Master Reverse Engineering Anything (REA)** repository connecting 5 core reverse-engineering projects into one cohesive workspace.

## Connected Repositories

| Module | Repository | Language | Role |
| :--- | :--- | :--- | :--- |
| **Core Engine** | [morluto/rea](https://github.com/morluto/rea) | TypeScript | Reverse engineer anything with agents, from app behavior down to native binaries |
| **Windows & MCP Bridge** | [tonchovet/REA-Windows-Github](https://github.com/tonchovet/REA-Windows-Github) | C++ | REA 6.3.0 binding Hopper & Ghidra through REA MCP, IDA bridge, binary scan & automation |
| **Skills & Prompts** | [smartworldarafath/REA_Skill](https://github.com/smartworldarafath/REA_Skill) | Python | 21 agent skills + 500 prompts for Antigravity, Claude Code, Codex & Cursor |
| **x86 Decompiler** | [DrBellubins/DecompileAnything](https://github.com/DrBellubins/DecompileAnything) | Python | Decompile x86 binaries into byte-matching human-readable source code |
| **Curated Cases** | [AIshihzong/awesome-reverse-engineer-anything](https://github.com/AIshihzong/awesome-reverse-engineer-anything) | Python | Curated AI reverse-engineering cases & open-source rebuild references |

## Quick Start

Clone with all connected modules:

```bash
git clone --recursive https://github.com/rajatinfo/Anti-Master-REA.git
cd Anti-Master-REA
```

Or on Windows PowerShell, run the bootstrap script to sync all 5 modules into `modules/`:

```powershell
.\bootstrap.ps1
```

## Project Structure

- `modules/rea` — Core REA agent framework
- `modules/REA-Windows-Github` — Windows/Hopper/Ghidra/IDA MCP integration
- `modules/REA_Skill` — Agent skills & prompt library
- `modules/DecompileAnything` — x86 binary-to-source decompiler
- `modules/awesome-reverse-engineer-anything` — Case studies & benchmarks
- `repos.json` — Machine-readable manifest of connected repositories