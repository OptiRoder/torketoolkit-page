# TorkeToolkit — Historial de Actualizaciones (Changelog)

## v3.3.2 (Migración PC → PC con AES-256, Centro de Drivers DCH + PnP Nativo, Mis Apps Personalizadas y Correcciones)

### Novedades Principales
- **Migración y Backup PC → PC (`PcMigrationWindow` / `PcMigrationService`):**
  - Asistente bilingüe completo para **Exportar este PC (Origen)** y **Restaurar Backup (Destino)** hacia disco externo, USB o partición de respaldo (`D:`), con **4 presets rápidos** (*Usuario Estándar*, *Gamer / Streamer*, *Oficina / Empresa*, *Técnico / Dev*) y cálculo en tiempo real de espacio libre (con aviso automático si eliges `C:` antes de formatear).
  - Respalda **20 módulos**: carpetas de usuario + carpetas extra personalizadas, **perfiles Wi-Fi** (`netsh wlan`), **marcadores** (Chrome, Edge, Brave, Vivaldi, Opera, Firefox), fondo/tema/Explorador, fuentes de usuario, Sticky Notes, **Game Saves**, **escenas de OBS Studio**, plantillas Office y firmas Outlook, configs Dev (VS Code + extensiones, Git, Terminal, `hosts`), VPNs/unidades de red/impresoras, licencias Windows/OEM y drivers (opcional para mismo PC).
  - **Inventario Completo de Todos los Programas Instalados + Fuentes de Descarga:** escanea las 3 ramas del Registro + `winget export`, empareja `WingetId`, extrae URLs oficiales del instalador y genera enlaces de búsqueda directa en un **reporte HTML interactivo** (`Ver Lista de Apps`) junto con restauración 1-clic vía Winget.
  - **Cifrado AES-256-GCM opcional con contraseña** para módulos sensibles y modo restauración **Combinar sin sobrescribir** (seguro por defecto).
- **Centro de Drivers Nivel Pro (`DriverCenterService` — Sin Windows Update):**
  - **Soporte completo DCH multi-CAB:** descarga y extrae **todos** los `.cab` del paquete oficial de Microsoft Update Catalog en subcarpetas aisladas (Base + Extension + SoftwareComponent).
  - **Validación y orden estricto de `.inf`:** clasifica e instala primero Base INF → Extension INF → SoftwareComponent INF, verificando que el `.inf` realmente declare el Hardware ID / `SUBSYS` / `CompatibleIDs` del dispositivo.
  - **Fallback PnP nativo con `newdev.dll` (`UpdateDriverForPlugAndPlayDevicesW`):** cuando `pnputil` agrega el driver al Driver Store pero devuelve código `259` (común en *Microsoft Basic Display Adapter* o dispositivos con *Error 28*), fuerza el enlace nativo del driver Base validado.
  - Detección de dispositivos sin driver (`Win32_PnPEntity` con `ConfigManagerErrorCode <> 0`), drivers genéricos de Microsoft, **Auto-Instalar Todo (1-Clic)** con orden seguro (Chipset → Disco → GPU → Red → Audio) y consultas directas concurrentes sin depender de Windows Update.
- **Mis Apps Personalizadas (`CustomAppStore` / `CustomAppEditorWindow`):**
  - Nueva sección en el Instalador con icono vectorial propio, categorías colapsables de 3 columnas, importación/exportación JSON (combinar o reemplazar), prueba de enlace en vivo, soporte para scripts PowerShell con confirmación explícita y traducción dinámica bilingüe (ES ↔ EN).

### Bugs y Problemas Corregidos
- **Corregido parser HTML de Microsoft Update Catalog:** extraía `"n/a"` en la columna 5 para ~90% de drivers Intel/AMD/Realtek; ahora lee la versión real desde el título (`C1`) y detecta correctamente los drivers de video, audio y red en laptops recién formateadas.
- **Corregido botón *Install Selected* deshabilitado tras *Select All (Updates)*:** ahora toma correctamente tanto la cola seleccionada como la fila activa en el Centro de Drivers.
- **Corregida detección falsa de GPU AMD en equipos Intel:** `"Intel CorporATIon"` coincidía con `.Contains("ATI")` en `HardwareTelemetryEngine.DetectGpuVendor`; ahora prioriza `VEN_8086`/`VEN_10DE`/`VEN_1002` y límites de palabra `\b(AMD|ATI)\b`.
- **Corregido bug de formato de MB descargados (`60 MB` salía como `601 MB`):** corregidos todos los especificadores `:0.1` / `:0.2` (que imprimían dígitos literales) a `:0.0` / `:0.00` en el Actualizador, Instalador, Centro de Drivers y Desinstalador.
- **Corregido plan *Ultimate Performance* en laptops OEM / Modern Standby:** cascada inteligente de 4 niveles (*Ultimate* → *High Performance* → clon optimizado desde *Balanced* → ajuste directo del plan activo).
- **Corregido ComboBox editable de categorías en *Mis Apps*** (texto invisible al escribir) y **actualizado el EULA** (sin referencias obsoletas a versiones anteriores) incluido desde el primer inicio.

## v3.3.1 (Corrección de Hilo en Game Booster y Micro-Animaciones Hover)
- **Corrección de error en *Restore Normal Game Priority* (`InvalidOperationException` entre hilos):** al pulsar **Restore Normal Game Priority**, el controlador leía `TxtGameExePath.Text` desde dentro de `RunSyncActionAsync` (hilo secundario), lo que provocaba el error *"El subproceso que realiza la llamada no puede obtener acceso a este objeto porque el propietario es otro subproceso"*. Ahora el nombre del ejecutable se captura en el hilo principal de la UI antes de ejecutar la restauración en segundo plano (auditado el resto de la app sin otros casos).
- **Micro-animaciones *Hover* restauradas en todos los botones y tarjetas:** se restauraron las transiciones suaves de escala (`ScaleTransform` con `CubicEase EaseOut` al entrar y salir del cursor) en `BtnMain`, `BtnAccent`, `BtnDanger`, `BtnSuccess`, `BtnGhost`, `BtnCompact`, `ProfileCardBtn` (tarjeta + icono) y `ActionTileBtn` (tarjeta + cápsula de icono + chevron).

## v3.3.0 (Torke HUD, Ahorro de Batería Extremo, Boost CPU Sostenido, Reductor RAM Win11 y Bandeja Oscura)
- **Torke HUD — Overlay ETW de Telemetría en Juegos (`TelemetryOverlayWindow` / `EtwFpsMonitorService`):** overlay flotante de bajísimo consumo (`<0.3%` CPU) con **FPS reales, Frametime y 1% Low vía ETW de Windows** (`Ctrl+Shift+O`), sin inyección de DLLs (0% riesgo con anti-cheats), diseño compacto en barra horizontal o vertical y activación automática al detectar partida.
- **Modo Ahorro de Batería Extremo (1-Clic Reversible, `ExtremeBatterySaverService`) + Visor de Informe de Batería (`BatteryReportWindow`):** apaga Turbo Boost en batería, limita CPU al 70% + EPP, ajusta brillo/60 Hz/transparencia, activa PCIe ASPM + USB/Wi-Fi y pausa procesos de fondo guardando un **snapshot automático** para restaurar todo (manualmente o al conectar el cargador AC); además de visor gráfico detallado de salud, ciclos e historial de batería.
- **Boost CPU Sostenido Seguro (`PowerPlanService.SetSustainedCpuBoost`):** sin alterar voltajes ni BCLK, fija **EPP al 0% en corriente AC**, habilita **Turbo Agresivo en AC**, mantiene **100% de núcleos activos en AC** y desactiva **Windows Power Throttling** en `OptimizeGaming()` y *Gaming Pro*.
- **Game Booster Más Agresivo + Reductor Modular de RAM en Windows 11 + 26 Nuevos Juegos:** `SmartGamingPreset` mejorado (`SystemFileCache` + `ModifiedPageList` + recorte desde `10 MB`), **Modo Boost Agresivo**, panel reversible de **7 módulos Windows 11** y **+26 juegos recientes y virales** (*Monster Hunter Wilds*, *Split Fiction*, *R.E.P.O.*, *Schedule I*, *Deadlock*, *Marvel Rivals*, *Path of Exile 2*, etc.).
- **Telemetría Real `CPU+iGPU`, Menú Oscuro en Bandeja y Splash Redondeado:** detección de gráficas integradas Intel/AMD para mostrar consumo honesto `CPU+iGPU`, nuevo menú contextual oscuro (`TrayPopupMenuWindow`) con lectura RAM en vivo, **Auto Game Booster**, **Boost Sostenido**, **Flush DNS** y **Modo Eco**, más `SplashWindow` redondeado con chips de subsistemas.

## v3.2.1 (Barras Retráctiles Vectoriales, Iconos Reales y Micro-Animaciones)
- **Barras Laterales Retráctiles con Iconos Vectoriales (Toolkit Principal e Installer):** modo compacto inicial (`64px`) con iconos vectoriales `24×24` de trazo limpio (cero emojis), expansión y cierre fluido con curva `CubicEase` (`64px` ↔ `218px`/`228px`), `ToolTip` instantáneo a la derecha al pasar el mouse y animación suave de agrandamiento del icono (`1.22x`).
- **178 Iconos Oficiales Reales en el Gestor de Software (`InstallerWindow`):** logos oficiales reales a color (`32×32` PNG) embebidos para todos los programas del catálogo, decodificados en memoria RAM con `BitmapImage.Freeze()` (`0 ms` de carga, `100% offline`).
- **Micro-Animaciones Fluidas en Todos los Botones y Mejoras Visuales:** transición suave de agrandamiento al pasar el mouse (`ScaleTransform`) en todos los botones del programa, marcos oscuros personalizados sin bordes blancos en ventanas secundarias, ocultamiento de clave de activación con botón de revelar, verificación Payhip API v2 (`1 / 3 / 5` usos) y botón directo de **Reportar Bug** (`optiroder@gmail.com`).

## v3.2.0 (Versión Consolidada de Lanzamiento)

### Centro de Drivers Oficiales y Descargas Simultáneas
- **Centro de Drivers Sin Windows Update (`DriverCenterWindow`):** escanea CPU, todas las GPUs y controladores clave (`Win32_PnPSignedDriver` + `Win32_Processor` + `Win32_VideoController`), consulta actualizaciones WHQL directamente por HTTP en **Microsoft Update Catalog** y **NVIDIA Official API**, permite selección múltiple en cola con **Seleccionar Todos (Updates)** e instala `.cab` vía `pnputil` con escudo protector para periféricos **INPUT/USB**.
- **Descargas Simultáneas (`1x`–`5x`) y Porcentaje en Vivo:** el Gestor de Software ahora permite elegir cuántas descargas correr en paralelo (`1x` a `5x`) con progreso global agregado (`0%`–`100%`), porcentaje en tiempo real para Winget, Chocolatey, descargas directas, Centro de Drivers y Actualizador.

### Batería, Carga Inteligente y Diagnóstico Preventivo
- **Salud de Batería, Ciclos y Carga Inteligente (`TORKE BATTERY GUARD`):** lectura nativa vía `IOCTL_BATTERY_QUERY_INFORMATION` + WMI (`% de salud`, `desgaste %`, `ciclos de carga`, `mWh` reales vs diseño, voltaje y potencia). Incluye modos **Tope Fijo (60–85%)**, **Horario** y **Adaptativo** (`PowerModeChanged`), adaptadores nativos para **ASUS** (`ATKACPI` + `AsusAtkWmi_WMNB`), **Dell** (`DCIM_BIOSService` WMI + `cctk.exe`), **HP** (`root\HP\InstrumentedBIOS` Battery Health Manager) y **Lenovo** (`EnergyDrv` + `PWRMGRV`), más soporte universal por **Enchufe Inteligente HTTP** y **Alerta en Bandeja**. Disponible desde **Plan 1**.
- **Autodiagnóstico Integral de Fallos (12 Puntos):** detector preventivo automático para espacio crítico en `C:`, alertas S.M.A.R.T., temperaturas elevadas, dispositivos con error en PnP (`ConfigManagerErrorCode`), desgaste de batería, RAM/Pagefile, servicios esenciales detenidos, Windows Update/reinicio pendiente, volcados BSOD recientes (`Minidump`), red/DNS, firewall y runtimes VC++.

### Telemetría en Tiempo Real e Info Hardware
- **Motor Nativo `LibreHardwareMonitorLib`:** lectura en tiempo real de temperaturas reales de CPU, GPU y discos (`°C`), frecuencias (`MHz`), consumo eléctrico total conjunto de la PC (`CPU + RAM RAPL + GPU + Base` / `PSU` / `Batería`), velocidad de red (`↓/↑ KB/s`) y ventiladores (`RPM`).
- **Monitor Renovado (Estilo Torke Lab):** 4 tarjetas KPI con riel lateral de color, osciloscopio en vivo (`CPU / RAM / GPU` con área sombreada), acceso rápido a **Liberar RAM**, **Batería 80%** y **Auditoría Hardware**. Disponible completo desde **Plan 1**.
- **Auditoría de Hardware y Sensores (9 sub-pestañas):** `Resumen` (con Matriz de Salud Torke), `Procesador` (topología de núcleos, cachés, instrucciones AVX/SSE/AES), `Gráfica` (antigüedad de driver y VRAM), `Memoria` (módulos DIMM y canal), `Placa base` (BIOS, VBS, HVCI, TPM, Secure Boot), `Almacenamiento` (discos, volúmenes y TRIM), `Red`, `Windows` y `Sensores (1s)` + exportación de informe sin datos sensibles.

### Gaming Pro, MiniOS X y Personalización
- **+1,000 Juegos y Emuladores en Game Booster:** ampliación masiva de `GameBoosterService` incluyendo emuladores (PCSX2, RPCS3, Dolphin, Cemu, Ryujinx, Yuzu/Suyu, DuckStation, PPSSPP, RetroArch, Xenia, Vita3K, MAME, BlueStacks, LDPlayer, etc.) y más de 1,000 títulos de PC.
- **MiniOS X Personalizable y Portable:** configurador visual con 16 módulos independientes (`MiniOsConfigWindow`), 3 presets rápidos y guardado automático en `minios-profile.json` + Exportar/Importar JSON para llevar tu perfil en USB a cualquier PC.
- **Tema Claro de Alto Contraste:** contraste mejorado en fondos, bordes, barra lateral, consola de operaciones, acentos adaptativos (`TorkeCyan`/`TorkeBlue`) y pestaña Sistema.

### Instalador, Desinstalador, Drivers y Licencias
- **Centro de Drivers y Actualizaciones Oficiales (`DriverCenterWindow`):** escanea hardware local (`Win32_PnPSignedDriver`), consulta actualizaciones reales WHQL desde **Microsoft Windows Update (`Microsoft.Update.Session`)** y **NVIDIA Official API**, abre búsquedas por Hardware ID en **Microsoft Update Catalog**, e instala asistentes OEM verificados vía Winget (`Intel DSA`, `NVIDIA App`, `AMD`, `Dell`, `HP`, `Lenovo`, `ASUS`, `SDIO`, `DDU`, `DriverStore Explorer`) con respaldo DISM previo.
- **Desinstalador Profundo Pro (Estilo Revo):** detección de restos en AppData/Registro/Accesos directos, cierre de procesos bloqueantes, reparación ACL, borrado al reiniciar (`MoveFileEx`), eliminación forzada, lote multi-app, actualización rápida con Winget e **iconos reales locales** asíncronos (0 KB extra en el ejecutable).
- **Instalador Resiliente de +140 Apps:** canales configurables (**Winget / Chocolatey / Directo**) con memoria automática ante fallos, verificación `.part` + SHA-256 / magic-bytes, sección ampliada de drivers y carpeta de descargas persistente.
- **Licenciamiento Tier 3 USB Unificado y KeyGen Privado:** las claves Nivel 3 activan el Modo USB Portable automáticamente con una sola clave, e incorporamos la interfaz privada `TorkeKeyGen.Gui`.

## Versiones anteriores (v3.0.x – v3.1.0 base)
- Arquitectura multiidioma completa (**Español / Inglés**) con validación automática de claves UI.
- Limpiador profundo de shaders/caché, Gestor de Inicio (`StartupManager`), Desinstalador de Bloatware UWP, Conversor/Merge de documentos, Modo Eco en bandeja y Taller Técnico Tier 3 con exportación PDF.

