# 🎮 GameOS Tool - Changelog

All notable changes to GameOS Tool are documented in this file.

---

## [1.0.17] - 2026-10-01
- **EN**: Taskbar clock/calendar flyout works again (DisableNotificationCenter policy is now removed; toasts stay disabled). MMCSS Games task corrected per Microsoft documentation: Scheduling Category Medium + Priority 6; unused GPU/SFIO Priority no longer written. Old values are migrated automatically on update.
- **TR**: Görev çubuğundaki saate tıklayınca açılan saat/takvim menüsü tekrar çalışıyor (DisableNotificationCenter politikası kaldırıldı; bildirimler kapalı kalmaya devam ediyor). MMCSS Games görevi Microsoft dokümantasyonuna göre düzeltildi: Scheduling Category Medium + Priority 6; kullanılmayan GPU/SFIO Priority artık yazılmıyor. Eski değerler güncellemede otomatik düzeltilir.
- **EN**: Laptop/desktop detection (SMBIOS chassis + battery). First Run defaults follow the device: laptops keep Bluetooth ON, Power Throttling, Balanced power plan and USB power saving; sensor services and Windows Hello are kept; dynamic tick is not disabled. Restart detection fixed: Gaming Process Scheduling and Device Cleanup no longer ask for a restart, USB Optimizations now does, DirectPlay only when DISM reports a pending reboot. Printing and SysMain start immediately when enabled. MSI mode only on devices whose driver supports it. Fixed a GameDVR_FSEBehavior registry path typo.
- **TR**: Dizüstü/masaüstü algılama (SMBIOS kasa tipi + pil). İlk Çalıştırma varsayılanları cihaza göre: dizüstünde Bluetooth AÇIK, Güç Kısıtlaması, Dengeli güç planı ve USB güç tasarrufu korunur; sensör servisleri ve Windows Hello çalışır; dynamic tick kapatılmaz. Yeniden başlatma algılaması düzeltildi: Oyun İşlem Zamanlaması ve Aygıt Temizliği artık yeniden başlatma istemiyor, USB Optimizasyonları artık istiyor, DirectPlay yalnızca DISM gerektirdiğinde. Yazdırma ve SysMain açıldığında hemen başlatılıyor. MSI modu yalnızca sürücüsü destekleyen aygıtlarda. GameDVR_FSEBehavior kayıt yolu yazım hatası düzeltildi.

---

## [1.0.16] - 2026-09-27
- **EN**: Windows Firewall enhancement: Keeps mpssvc service active for full compatibility with software installers (e.g. Elgato Stream Deck) while toggling all 3 firewall profiles (Domain, Private, Public) off.
- **TR**: Windows Güvenlik Duvarı iyileştirmesi: Stream Deck gibi yükleyicilerle tam uyumluluk için mpssvc hizmeti aktif tutulur ve 3 profil (Domain, Özel, Ortak) kapalı olarak yapılandırılır.

---

## [1.0.15] - 2026-09-15
- **EN**: FirstRun button text optimization, embedded icon extraction fix, and full elimination of residual installation files.
- **TR**: FirstRun uygula butonu metin optimizasyonu, gömülü ikon çıkarma düzeltmesi ve kurulum sonrası artık dosyaların tamamen temizlenmesi.

---

## [1.0.14] - 2026-09-12
- **EN**: Fixed FirstRun bug where changing any setting prematurely enabled the "Apply Tweaks & Restart" button before background setup finished.
- **TR**: FirstRun sırasında herhangi bir ayar değiştirildiğinde arka plan kurulum görevleri bitmeden "Ayarla ve Yeniden Başlat" butonunun erkenden aktifleşmesi sorunu düzeltildi.

---

## [1.0.13] - 2026-09-12
- **EN**: GameOS Tool has been made compatible with GameOS Playbook, Ram Cleaner bug fixes applied.
- **TR**: GameOS Tool, GameOS Playbook ile uyumlu hale getirildi, Ram Cleaner hata düzeltmeleri yapıldı.

---

## [1.0.12] - 2026-09-06
- **EN**: Removed unnecessary missing file popup when launching games with Gamebar disabled, updated system cleanup and services.
- **TR**: Gamebar kapalıyken oyun açıldığında arka planda çıkan gereksiz dosya eksik uyarısı kaldırıldı, bazı servisler ve ayarlar güncellendi.

---

## [1.0.11] - 2026-08-19
- **EN**: Gaming Process Scheduling presets updated with 42 (Decimal) default, recommended preset tooltips, modern tooltips, UI flag icons in language selector, and revamped toolbox icon.
- **TR**: Oyun İşlem Zamanlaması varsayılanı 42 (Decimal) yapıldı, önerilen ayar ipuçları, modern tooltip tasarımı, dil seçiminde bayrak ikonları ve yenilenen araç kutusu ikonu eklendi.

---

## [1.0.10] - 2026-08-15
- **EN**: The MTU value was set incorrectly in some cases; this has been corrected.
- **TR**: MTU değeri bazı durumlarda yanlış ayarlanıyordu, düzeltildi.

---

## [1.0.9] - 2026-08-13
- **EN**: Embedded wallpaper directly into binary with automatic cleanup.
- **TR**: Duvar kağıdı doğrudan ikili dosyaya (.exe) gömüldü ve otomatik temizleme eklendi.

---

## [1.0.8] - 2026-08-13
- **EN**: Fixed issue where left-clicking the taskbar clock did not open the clock popup/calendar.
- **TR**: Görev çubuğundaki saate sol tıklandığında herhangi bir popup çıkmama sorunu düzeltildi.

---

## [1.0.7] - 2026-08-13
- **EN**: Always administrator mode activated. (EnableLUA=0)
- **TR**: Artık her şey yönetici yetkisiyle çalışacak şekilde ayarlandı. (EnableLUA=0)

---

## [1.0.6] - 2026-08-09
- **EN**: Gaming Process Scheduling logic changed, now you can enter your own numbers and there are now recommended ones.
- **TR**: Oyun İşlem Zamanlaması artık elle sayı girilebilir duruma getirildi, önerilen sayılar eklendi. Varsayılan 36 olarak seçildi.

---

## [1.0.5] - 2026-08-06
- **EN**: Ram cleaner stutter fix.
- **TR**: Ram Temizleyici takılmaya (stutter) sebep oluyordu, düzeltildi.

---

## [1.0.4] - 2026-08-06
- **EN**: Fixed issue where changing language was detected as an update and reapplied settings.
- **TR**: Dil değiştirildiğinde güncelleme olarak algılanıp ayarların tekrar uygulanması sorunu düzeltildi.

---

## [1.0.3] - 2026-08-06
- **EN**: Task Scheduler tasks now automatically delete and re-create upon update.
- **TR**: Güncelleme sonrası Görev Zamanlayıcı görevlerinin otomatik silinip yenilenmesi sağlandı.

---

## [1.0.2] - 2026-08-06
- **EN**: "Ram Cleaner" has been improved to provide better experience while gaming.
- **TR**: "RAM Temizleyici" oyunlarda daha iyi performans alınabilmesi için geliştirildi.

---

## [1.0.1] - 2026-08-05
- **EN**: Added automatic update checking engine with SHA256 verification. Excluded game launcher clients from triggering RAM cleaner.
- **TR**: Otomatik güncelleme denetleme sistemi ve SHA256 doğrulama desteği eklendi. Oyun istemcilerinin RAM temizliği tetiklemesi engellendi.

---

## [1.0.0] - 2026-08-01
- **EN**: Initial release of GameOS Tool.
- **TR**: GameOS Tool ilk sürüm yayınlandı.
