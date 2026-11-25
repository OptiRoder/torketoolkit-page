# TorkeToolkit — Update History (Changelog)

## v3.3.2 (PC-to-PC Migration with AES-256, Multi-CAB DCH Driver Center + Native PnP, Custom My Apps & Bug Fixes)

### Major New Features
- **PC-to-PC Migration & Backup (`PcMigrationWindow` / `PcMigrationService`):**
  - Full bilingual wizard to **Export This PC (Source)** and **Restore Backup (Destination)** to an external drive, USB, or backup partition (`D:`), with **4 one-click presets** (*Standard User*, *Gamer / Streamer*, *Office / Business*, *Technician / Dev*), real-time free space validation, and an automatic warning if targeting `C:` before formatting.
  - Backs up **20 modular categories**: user folders + extra custom folders, **saved Wi-Fi profiles** (`netsh wlan`), **browser bookmarks** (Chrome, Edge, Brave, Vivaldi, Opera, Firefox), wallpaper/theme/Explorer preferences, user fonts, Sticky Notes, **Game Saves**, **OBS Studio scenes & profiles**, Office templates & Outlook signatures, Dev configs (VS Code + extensions, Git, Terminal, `hosts`), VPNs/mapped drives/printers, Windows/OEM license keys, and drivers (optional, same-PC only).
  - **Full Installed Programs Inventory + Download Sources:** scans all 3 Windows Uninstall registry hives + `winget export`, matches `WingetId`s, extracts official installer URLs, and builds smart download search links in an **interactive HTML report** (`View Apps List`) alongside 1-click Winget reinstall.
  - **Optional AES-256-GCM password encryption** for sensitive modules and safe **merge without overwriting** by default on restore.
- **Pro-Grade Driver Center (`DriverCenterService` — No Windows Update Required):**
  - **Full multi-CAB DCH support:** downloads and extracts **all** `.cab` files returned by Microsoft Update Catalog into isolated subfolders (Base + Extension + SoftwareComponent).
  - **Strict `.inf` validation & install ordering:** classifies and installs Base INF → Extension INF → SoftwareComponent INF in order, verifying that the `.inf` explicitly declares the device's real Hardware ID / `SUBSYS` / `CompatibleIDs`.
  - **Native `newdev.dll` PnP fallback (`UpdateDriverForPlugAndPlayDevicesW`):** when `pnputil` stages a driver into the Driver Store but returns exit code `259` (common on *Microsoft Basic Display Adapter* or *Error 28* devices), forces targeted native PnP binding using the validated Base `.inf`.
  - Surfaces missing-driver (`Win32_PnPEntity` `ConfigManagerErrorCode <> 0`) and generic Microsoft fallback devices, adds **1-Click Auto-Install All** in safe hardware order (Chipset → Storage → GPU → Network → Audio), and runs concurrent direct catalog lookups without Windows Update.
- **My Custom Apps (`CustomAppStore` / `CustomAppEditorWindow`):**
  - Dedicated Software Installer tab with its own unique vector icon, 3-column collapsible categories, JSON import/export (merge or replace), live URL reachability test, PowerShell script support with explicit confirmation, and dynamic ES ↔ EN category translation.

### Bug Fixes & Improvements
- **Fixed Microsoft Update Catalog HTML version parser:** column 5 returns `"n/a"` for ~90% of Intel/AMD/Realtek drivers; parser now extracts real dotted versions from the title (`C1`), reliably finding GPU, audio, and network drivers on freshly formatted laptops.
- **Fixed *Install Selected* staying disabled after clicking *Select All (Updates)*:** now properly enables and installs all queued updates in Driver Center.
- **Fixed Intel GPUs being mislabeled as AMD in Hardware Info:** `"Intel CorporATIon"` matched `.Contains("ATI")` in `HardwareTelemetryEngine.DetectGpuVendor`; now checks PCI Vendor IDs (`VEN_8086`/`VEN_10DE`/`VEN_1002`) first and uses `\b(AMD|ATI)\b`.
- **Fixed download MB display bug (`60 MB` showing as `601 MB`):** fixed all 13 `:0.1` / `:0.2` custom numeric format specifiers (which printed literal `1`/`2`) across the Updater, Installer, Driver Center, and Uninstaller.
- **Fixed *Ultimate Performance* power plan on OEM / Modern Standby laptops:** 4-tier fallback (*Ultimate* → *High Performance* → cloned optimized *Balanced* → direct active scheme tuning).
- **Fixed editable Category ComboBox preview in *My Apps*** and **updated EULA** across all bundled resources so first-time users see the current license terms.

## v3.3.1 (Game Booster Thread-Safety Fix & Restored Hover Micro-Animations)
- **Fixed cross-thread `InvalidOperationException` in *Restore Normal Game Priority*:** clicking **Restore Normal Game Priority** previously read `TxtGameExePath.Text` inside `RunSyncActionAsync` (on a background thread), causing *"The calling thread cannot access this object because a different thread owns it."* The custom `.exe` name is now captured on the UI thread before running `RestoreNormalGamePriorities` in the background (full codebase audited with no other occurrences).
- **Restored smooth Hover Micro-Animations across all buttons & cards:** restored `ScaleTransform` + `CubicEase EaseOut` hover/unhover transitions on `BtnMain`, `BtnAccent`, `BtnDanger`, `BtnSuccess`, `BtnGhost`, `BtnCompact`, `ProfileCardBtn` (card + icon), and `ActionTileBtn` (tile + icon badge + chevron).

## v3.3.0 (Torke HUD, Extreme Battery Saver, Sustained CPU Boost, Win11 RAM Reducer & Dark Tray)
- **Torke HUD — Real-Time ETW In-Game Telemetry Overlay (`TelemetryOverlayWindow` / `EtwFpsMonitorService`):** ultra-lightweight (`<0.3%` CPU) floating overlay displaying **real FPS, Frametime, and 1% Low via Windows ETW** (`Ctrl+Shift+O`), zero DLL injection (0% anti-cheat risk), auto-show on game launch, and compact horizontal/vertical layouts.
- **Extreme Battery Saver Mode (1-Click Reversible, `ExtremeBatterySaverService`) + Battery Report Viewer (`BatteryReportWindow`):** disables Turbo Boost on battery, caps CPU to 70% + high-efficiency EPP, drops display to 30%/60Hz & disables DWM transparency, enforces PCIe ASPM + USB/Wi-Fi saving, throttles background services, and saves an **automatic snapshot** to restore everything cleanly (manually or on AC charger plug-in), paired with an interactive battery health/cycle report viewer.
- **Safe Sustained CPU Boost (`PowerPlanService.SetSustainedCpuBoost`):** without touching voltages or BCLK, sets **0% AC EPP**, enables **Aggressive AC Turbo**, keeps **100% AC cores unparked**, and disables **Windows Power Throttling** in `OptimizeGaming()` and *Gaming Pro*.
- **Stronger Smart RAM Clean + Win11 RAM Reducer + 26 New Games:** upgraded `SmartGamingPreset` (`SystemFileCache` + `ModifiedPageList` + `10 MB` trim), **Aggressive Boost Mode**, **7-module reversible Win11 RAM Reducer**, and **+26 recent competitive/co-op titles** (*Monster Hunter Wilds*, *Split Fiction*, *R.E.P.O.*, *Schedule I*, *Deadlock*, *Marvel Rivals*, *Path of Exile 2*, etc.).
- **Accurate `CPU+iGPU` Telemetry, Dark Tray Menu & Rounded Splash:** detects Intel/AMD integrated GPUs for accurate `CPU+iGPU` power readout, adds a dark styled tray popup (`TrayPopupMenuWindow`) with live RAM usage, **Auto Game Booster**, **Sustained CPU Boost**, **Flush DNS**, and **Eco Mode**, plus a cleanly rounded `SplashWindow` with subsystem chips.

## v3.2.1 (Collapsible Vector Sidebars, Real Program Icons & Fluid Micro-Animations)
- **Collapsible Vector-Icon Navigation Sidebars (MainWindow & Software Installer):** compact `64px` icon-only default view with crisp `24×24` vector icons (zero emojis), smooth `CubicEase` expansion (`64px` ↔ `218px`/`228px`), instant right-side localized hover tooltips, and smooth icon hover scale animations (`1.22x`).
- **178 Real Official Program Icons in Software Installer (`InstallerWindow`):** embedded `32×32` full-color official icons for all 178 catalog apps, decoded in-memory via `BitmapImage.Freeze()` (`0 ms` lag, `100% offline`).
- **Global Fluid Hover Micro-Animations & Polish:** smooth hover/unhover scale transitions on all buttons, custom dark secondary window frames, masked license key input with eye reveal toggle, Payhip API v2 license verification (`1 / 3 / 5` usage caps), and direct **Report a Bug** button (`optiroder@gmail.com`).

## v3.2.0 (Consolidated Release)

### Official Driver Center & Simultaneous Downloads
- **Driver Center Without Windows Update (`DriverCenterWindow`):** scans your CPU, all GPUs, and core hardware drivers (`Win32_PnPSignedDriver` + `Win32_Processor` + `Win32_VideoController`), queries WHQL driver updates directly over HTTP from **Microsoft Update Catalog** and the **NVIDIA Official API**, supports multi-select queuing / **Select All (Updates)**, installs `.cab` packages via `pnputil`, and enforces an **INPUT/USB** safety shield.
- **Simultaneous Downloads (`1x`–`5x`) & Real-Time Percentages:** the Software Installer now includes a concurrency selector (`1x` to `5x`) with aggregated global progress (`0%`–`100%`) and live percentages across Winget, Chocolatey, direct downloads, Driver Center, and Self-Updater.

## v3.1.0 (Accumulated Features)

### Battery Guard, Smart Charging & Preventive Self-Diagnostics
- **Battery Health, Cycle Count & Smart Charge (`TORKE BATTERY GUARD`):** native telemetry via `IOCTL_BATTERY_QUERY_INFORMATION` + WMI (Health %, Wear %, Charge Cycles, Full vs Design mWh, Voltage, and Wattage). Includes **Fixed Cap (60–85%)**, **Scheduled Departure**, and **Adaptive Learning** (`PowerModeChanged`) with native adapters for **ASUS** (`ATKACPI` + `AsusAtkWmi_WMNB`), **Dell** (`DCIM_BIOSService` WMI + `cctk.exe`), **HP** (`root\HP\InstrumentedBIOS` Battery Health Manager), and **Lenovo** (`EnergyDrv` + `PWRMGRV`), plus universal **HTTP Smart Plug** and tray alerts. Available from **Tier 1**.
- **12-Point Full Failure Self-Diagnostic:** preventive checker for critical `C:` free space, S.M.A.R.T. health, CPU/GPU/Disk thermal warnings, PnP driver errors (`ConfigManagerErrorCode`), battery wear, RAM/Pagefile pressure, essential services, pending reboot, recent BSOD Minidumps, network/DNS health, Windows Firewall, and VC++ runtimes.

### Real-Time Telemetry & Hardware Audit
- **Native `LibreHardwareMonitorLib` Engine:** live CPU, GPU & Disk temperatures (`°C`), core clocks (`MHz`), combined PC power draw (`CPU + RAM RAPL + GPU + Base` / `PSU` / `Battery`), network throughput (`↓/↑ KB/s`), and fan speeds (`RPM`).
- **Torke Lab Monitor:** 4 color-coded KPI cards, live oscilloscope graph (`CPU / RAM / GPU` with shaded area), 1-click **Trim RAM**, **Battery 80%**, and **Hardware Audit**. Available in **Tier 1**.
- **9-Tab Hardware & Sensors Audit:** `Overview` (with Torke Health Matrix), `Processor` (core topology, caches, AVX/SSE/AES), `Graphics` (driver age & VRAM), `Memory` (DIMM modules & channels), `Motherboard` (BIOS, VBS, HVCI, TPM, Secure Boot), `Storage` (drives, volumes & TRIM), `Network`, `Windows`, and `Sensors (1s)` + privacy-safe JSON export.

### Gaming Pro, MiniOS X & Personalization
- **+1,000 Games & Emulators in Game Booster:** expanded `GameBoosterService` detection covering PC games and major emulators (PCSX2, RPCS3, Dolphin, Cemu, Ryujinx, Yuzu/Suyu, DuckStation, PPSSPP, RetroArch, Xenia, Vita3K, MAME, BlueStacks, LDPlayer, and 1,000+ titles).
- **Portable & Customizable MiniOS X:** 16 independent modules (`MiniOsConfigWindow`), 3 quick presets, automatic `minios-profile.json` persistence, and USB JSON Export/Import.
- **High-Contrast Light Theme:** tuned surfaces, borders, sidebar contrast, live log console, adaptive accents (`TorkeCyan`/`TorkeBlue`), and System tab polish.

### Installer, Deep Uninstaller & Licensing
- **Deep Uninstaller Pro (Revo-style):** leftover AppData/Registry/shortcut scanner, blocking process killer, ACL repair, pending-delete on reboot (`MoveFileEx`), forced removal, batch uninstall, Winget quick upgrade, and async local **real app icons** (0 KB bloat).
- **Resilient +140-App Installer:** configurable channels (**Winget / Chocolatey / Direct**) with automatic failure memory, `.part` atomic download + SHA-256 / magic-byte validation, and custom Downloads directory.
- **Unified Tier 3 USB Licensing & Private KeyGen:** a single Tier 3 license key activates Portable USB Mode automatically without needing dual keys.

## Earlier Releases (v3.0.x – v3.1.0 base)
- Full **English / Spanish** multi-language UI architecture with automated XAML validation.
- Deep Shader/Cache Cleaner, Startup Manager, UWP Bloatware Remover, Document Converter/Merger, Tray Eco Mode, and Technician Workshop with PDF Before/After Benchmark export.

