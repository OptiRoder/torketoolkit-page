<div align="center">

# ⚡ TorkeToolkit Suite `v3.3.2`

**The Ultimate Windows 10 & 11 Performance, Driver Center, Battery Guard & IT Technician Suite**

[![Latest Release](https://img.shields.io/badge/Release-v3.3.2-3b82f6?style=for-the-badge&logo=github)](https://github.com/OptiRoder/TorkeToolkit-Suite/releases/latest)
[![Platform](https://img.shields.io/badge/Platform-Windows%2010%20%7C%2011%20(x64)-0078d4?style=for-the-badge&logo=windows)](https://torketoolkit.com/)
[![Runtime](https://img.shields.io/badge/.NET%2010-Native%20Self--Contained-8b5cf6?style=for-the-badge&logo=dotnet)](https://torketoolkit.com/)
[![Privacy](https://img.shields.io/badge/Telemetry-Zero%20(100%25%20Offline)-10b981?style=for-the-badge)](https://github.com/OptiRoder/TorkeToolkit-Suite)

🌐 **[Official Website](https://torketoolkit.com/)** • 📥 **[Download Latest Release (v3.3.2)](https://github.com/OptiRoder/TorkeToolkit-Suite/releases/latest)** • 📖 **[Español (README_es.md)](./README_es.md)** • 📋 **[Changelog](./CHANGELOG.md)**

---

![TorkeToolkit System Optimization](https://torketoolkit.com/source/shot-optimization-2x.webp?v=330)

</div>

## 🚀 Overview

**TorkeToolkit** is a native C# (`.NET 10`) system optimization, hardware diagnostics, and IT workshop suite built for **Windows 10 and Windows 11 (x64)**. Unlike fragile batch scripts or bloated utilities filled with ads and background telemetry, TorkeToolkit delivers surgical latency tuning, safe sustained CPU boost, direct official driver updates without Windows Update, multi-threaded software installation, native battery health protection, and certified PDF client reporting in a single self-contained binary.

---

## 📥 Official Downloads (`v3.3.2`)

| Edition | Format | Size | Best For | Direct Link |
| :--- | :--- | :--- | :--- | :--- |
| **Official Installer (Recommended)** | Guided `.EXE` Setup | ~60 MB | Personal PCs & Gaming Rigs (Desktop/Start Menu shortcuts + clean Control Panel uninstaller) | [**Download Setup v3.3.2**](https://github.com/OptiRoder/TorkeToolkit-Suite/releases/latest/download/TorkeToolkit-Setup-v3.3.2.exe) |
| **Portable Technician Edition** | Standalone `.EXE` | ~65 MB | USB Flash Drives, IT Technicians & On-Site Support (Zero installation, zero leftover traces) | [**Download Portable v3.3.2**](https://github.com/OptiRoder/TorkeToolkit-Suite/releases/latest/download/TorkeToolkit-Portable-v3.3.2.exe) |

### ⚡ Instant PowerShell Launch (Administrator)

Run TorkeToolkit Portable directly from an elevated **PowerShell** window:

```powershell
irm https://torketoolkit.com/toolkit.ps1 | iex
```

---

## 🛠️ Complete Module Documentation

### 0. 💾 PC-to-PC Migration & Backup (`NEW in v3.3.2`)
- **20 Modular Backup Categories & 4 Quick Presets:** User files + extra folders, saved Wi-Fi profiles (`netsh wlan`), browser bookmarks, Windows theme/wallpaper/Explorer settings, user fonts, Sticky Notes, Game Saves, OBS Studio scenes, Office templates & Outlook signatures, Dev configs (VS Code + extensions, Git, Terminal, `hosts`), VPNs/mapped drives/printers, Windows/OEM license keys, and optional same-PC drivers.
- **Full Installed Programs Inventory + Download Sources:** Scans all 3 Windows Uninstall registry hives + `winget export`, matches `WingetId`s, extracts official URLs, and builds a searchable interactive HTML report (`View Apps List`) with 1-click Winget reinstall.
- **AES-256-GCM Optional Encryption & Safe Merge Restore:** Password-protects sensitive modules, checks target drive free space, warns before targeting `C:` prior to formatting, and restores without overwriting existing files by default.

### 1. ⚡ System Optimization & Latency Engine
- **5 Calibrated Profiles:** `Minimal`, `Safe`, `Recommended`, `Gaming (FPS + Latency)`, and `Extreme`.
- **Kernel & BCD Tuning:** Fine-tunes MMCSS multimedia scheduling, Win32PrioritySeparation, timer resolution, memory paging, and boot acceleration.
- **Full Reversibility:** Automatic **System Restore Points** and **Registry/Service Snapshots** before applying changes, with **1-Click Rollback** at any time.

### 2. 🎮 Gaming Pro, Game Booster, Sustained Boost & Win11 RAM Reducer
- **Gaming Readiness Score (`0%`–`100%`):** Audits Game Mode, HAGS, VBS/HVCI overhead, power plan, timer latency, and GPU MSI-Mode interrupts.
- **Torke HUD (ETW In-Game Overlay):** Real FPS, Frametime & 1% Low (`Ctrl+Shift+O`) with zero DLL injection (`<0.3%` CPU).
- **Safe Sustained CPU Boost (`0%` AC EPP + PowerThrottling OFF):** Keeps Intel Speed Shift / AMD CPPC clocks responsive under load without altering voltages or BCLK.
- **+1,000 Supported Games & Emulators + Aggressive Mode:** Automatic detection and priority boosting across PC titles, recent viral releases, and emulators (`RPCS3`, `Yuzu/Ryujinx`, `Dolphin`, `PCSX2`, `Cemu`) with stutter-free RAM & Standby cleaning.
- **Modular Windows 11 RAM Reducer:** 7 independent reversible toggles (Copilot/Widgets/Bing WebView2, UWP background apps, Edge/Chrome Startup Boost, `SysMain`, `WSearch`, `DiagTrack`, Transparency).
- **Dark Styled Tray Menu:** Live RAM header, 1-click Auto Game Booster, Sustained CPU Boost, Flush DNS, RAM cleaners, and Eco Sleep Mode (`<25 MB`).

### 3. 🧩 Official Driver Center (No Windows Update Needed)
- **Direct Official Queries:** Queries the **Microsoft Update Catalog** over direct HTTPS and the **NVIDIA Official Driver API**—works even if the Windows Update service (`wuauserv`) is disabled or broken.
- **CPU & Multi-GPU Coverage:** Detects processors (`ACPI\GenuineIntel`, `ACPI\AuthenticAMD`), discrete/integrated GPUs (`NVIDIA`, `AMD`, `Intel`), chipset, audio, and network controllers.
- **Batch Queue & Select All:** Queue multiple drivers at once, select/deselect all with one click, and install official WHQL `.cab` packages silently via `pnputil /add-driver /install`.
- **Input/USB Freeze Protection:** Automatically filters out active mouse, keyboard, and USB HID controllers during batch updates so you never lose input control.

### 4. 📦 Multi-Threaded Software Installer (`1x`–`5x` Concurrency)
- **Simultaneous Downloads:** Choose between `1x`, `2x`, `3x`, `4x`, or `5x` parallel downloads (`SemaphoreSlim` worker queue).
- **Live Percentage Telemetry:** Real-time `0%`–`100%` progress parsing across **Winget**, **Chocolatey**, and **Direct HTTPS** downloads, plus aggregated global progress.
- **Curated Catalog:** Browsers, gaming launchers, runtimes (`VC++ Redist All-in-One`, `.NET`, `DirectX`), development tools, and utilities—100% free of bundled adware.

### 5. 🔋 Torke Battery Guard & Smart Charge Engine
- **Native Hardware Telemetry:** Reads Design Capacity, Full Charge Capacity, Wear Level %, Voltage (`mV`), Charge/Discharge Rate (`mW`), Chemistry, and Cycle Count directly via `IOCTL_BATTERY_QUERY_INFORMATION` (`kernel32.dll`) + WMI fallbacks.
- **3 Smart Charge Modes:**
  - **Fixed Limit:** Configurable charge cap (`50%`–`100%`, default `80%`) with hysteresis resume threshold.
  - **Scheduled Charging:** Keep battery capped at `80%` during the day and top up to `100%` only inside your configured window.
  - **Adaptive Mode:** Automatically lowers charge ceiling (`75%`) during prolonged AC desktop sessions.
- **Extreme Battery Saver (1-Click Reversible) + Report Viewer:** Auto-snapshot power profile throttling CPU/Turbo/EPP, 60Hz/brightness/transparency, PCIe ASPM & background apps with optional auto-restore on AC plug-in, plus visual battery health reports.
- **OEM Hardware & Smart Plug Integration:** Native charge threshold hooks for **ASUS**, **Lenovo**, **Dell**, and **HP** laptops, plus **HTTP Webhook Smart Plug** automation (`TurnOnUrl` / `TurnOffUrl`) and high-priority `TORKE BATTERY GUARD` alerts.

### 6. 🩺 12-Point Full System Self-Diagnostic
Performs an automated 12-point health audit in seconds and queues 1-click repairs:
1. System drive (`C:`) free space
2. Physical disk **S.M.A.R.T.** status
3. CPU & storage thermal sensors
4. Device Manager (`PnP`) error codes
5. Laptop battery wear level
6. RAM memory pressure
7. Critical Windows services (`RpcSs`, `Dhcp`, `Dnscache`, `EventLog`, `Schedule`, `Winmgmt`)
8. Pending system reboot flags (`CBS` / `WindowsUpdate` / `PendingFileRenameOperations`)
9. Recent BSOD Minidumps (`C:\Windows\Minidump` within the last 7 days)
10. Network adapter & DNS resolution health
11. Windows Firewall status across Domain, Private, and Public profiles
12. Microsoft Visual C++ Redistributable (`x64`) runtime integrity

### 7. 🛠️ IT Technician Workshop Suite (Tier 3)
- **Portable USB Technician Mode:** Activate once on your technician USB drive and service **unlimited client PCs** without leaving license files or residues on customer machines.
- **Certified Vector PDF Reports:** Export professional Before/After diagnostic and maintenance reports in PDF with your repair shop's branding.
- **Windows Rescue & Security Tools:** Print Spooler, Windows Update & WSReset repairs, AES-256 File Encryptor, Document Converter, and Live USB Rescue builders.

---

## 🔒 Security & Privacy Architecture

- **Zero Telemetry:** TorkeToolkit never tracks user behavior, hardware serials, or browsing activity.
- **Offline Cryptographic Licensing:** License verification runs 100% offline using **Ed25519** asymmetric digital signatures.
- **Safe By Design:** Every registry, service, and BCD modification is logged and backed up prior to execution.

---

## ❤️ Support & Donations

If **TorkeToolkit** helps boost your PC performance or saves you hours in your IT repair shop, consider supporting independent development:

- 💖 **[Support & Donate via Official Website](https://torketoolkit.com/#donaciones)**
- ⭐ **Star this repository** on GitHub to help more gamers and technicians discover the project!

---

## 📄 License & Copyright

Copyright © 2026 **RODER**. All rights reserved.  
Distributed under the [End-User License Agreement (EULA)](./EULA_en.txt).
