# 📜 GameOS Tool - Changelog

All notable changes to GameOS Tool will be documented in this file.

---

## [1.0.3] - 2026-08-06

### 🚀 RAM Cleaner & Optimization
- **Zero-Stutter Gaming Protection**: Disabled Working Set trimming (`MemoryEmptyWorkingSets`) during active gameplay to eliminate micro-stutters.
- **Single Purge per Game Session**: Implemented PID lock mechanism (`HKLM\SOFTWARE\GameOS\LastPurgedGamePid`). RAM is cleaned only once when a game opens.
- **Automatic Task Recreation**: Updated `-PostUpdate` flow to explicitly delete and re-create all active Task Scheduler tasks with updated parameters.

### 🐛 Bug Fixes & Stability
- Added UTF-8 encoding configuration to `WebClient` to fix Turkish character rendering (Mojibake).
- Added fallback download URL to prevent empty path errors during auto-update.

---

## [1.0.2] - 2026-08-06

### 🚀 Features & Enhancements
- Adjusted RAM Cleaner free memory threshold to **< 65% Free RAM**.
- Removed hardcoded game keyword arrays (`gameKeywords`); game detection now uses pure Win32 fullscreen window & 3D graphics/engine module detection.
- Fast-path CLI optimization: `-RunRamCleaner` check placed at top of `Main()` (~50ms execution).
- Removed manual "Purge Now" UI button per user request.

---

## [1.0.1] - 2026-08-05

### 🚀 Improvements
- Added automated update checking engine with SHA256 checksum verification.
- Excluded game launcher clients (`steam`, `epic`, `ubisoft`, `ea`, `battlenet`, etc.) from triggering auto-cleaning.
- Improved system cache Standby List purging safety.

---

## [1.0.0] - 2026-08-01

### 🎉 Initial Release
- Initial release of GameOS Tool for Windows.
- System tweaks, service optimizations, power plan configurations, and automated OOBE setup.
