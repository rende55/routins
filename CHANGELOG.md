# Değişiklik Günlüğü

Tüm önemli değişiklikler bu dosyada belgelenecektir.

## [2.0.0] - 2025-11-17 01:15

### Dokümantasyon
- 📚 `docs/` dizini oluşturuldu
- 📄 PROJECT_CONCEPT.md: Proje konsepti, vizyon ve hedefler (4000+ satır)
- 📄 DEVELOPMENT_PLAN.md: Geliştirme planı ve öncelikler (500+ satır)
- 📄 ARCHITECTURE.md: Teknik mimari ve tasarım prensipleri (800+ satır)
- 📄 SUMMARY.md: Proje özeti ve hızlı bakış (400+ satır)
- 📄 docs/README.md: Dokümantasyon rehberi
- 📝 Ana README.md güncellendi (yeni özellikler ve yapı)
- 🎯 Gelecek özellikler ve roadmap belirlendi
- 🔧 Teknik borç ve iyileştirmeler listelendi
- 📊 Sprint planları ve milestone'lar tanımlandı

### Yeniden Yapılandırma
- 🎨 Uygulama tamamen yeniden tasarlandı (React şablonuna göre)
- 🏗️ Ana yapı güncellendi: Bottom Navigation, Gradient Header, FAB
- 📱 3 ana ekran eklendi:
  - Dashboard (Ana Sayfa): Kategoriler, Bugünkü Rutinler, Yaklaşan Etkinlikler
  - Calendar (Takvim): Günlük, Haftalık, Aylık görünümler
  - Goals (Hedefler): Hedef takibi, ilerleme gösterimi, başarılar
- ➕ Etkinlik ekleme dialog'u: Tek seferlik ve rutin etkinlik desteği
- 🎨 Özel logo tasarımı (CustomPainter ile)
- 🌈 Modern gradient renk paleti (Indigo-Purple)
- 📊 Kategori sistemi: Finans, Eğitim, Sağlık, İş
- 🎯 Hedef takip sistemi ve ilerleme göstergeleri
- 📅 Gelişmiş takvim görünümleri
- ✨ Material Design 3 ile tutarlı tasarım dili

### Teknik Detaylar
- Flutter TabController kullanımı
- CustomPainter ile özel logo çizimi
- SingleChildScrollView ile kaydırılabilir içerik
- Dialog widget'ları ile modal formlar
- Gradient dekorasyonlar
- Responsive grid layout'lar
- Android Gradle Plugin 8.3.0'a güncellendi (Java 21 uyumluluğu için)
- Kotlin 1.9.0'a güncellendi
- Gradle 8.4'e güncellendi (AGP 8.3.0 gereksinimi)

## [1.0.0] - 2025-11-17 00:08

### Eklenenler
- 🎉 İlk sürüm yayınlandı
- ✨ Rutin ekleme, düzenleme ve silme özellikleri
- 📊 Günlük ilerleme takip sistemi
- 🔥 Ardışık gün seri takibi
- 🏷️ Kategori bazlı rutin organizasyonu (Sağlık, Spor, Eğitim, İş, Kişisel Gelişim, Hobi, Diğer)
- 📅 7 günlük geçmiş görüntüleme
- 💾 SharedPreferences ile yerel veri saklama
- 🎨 Material Design 3 ile modern arayüz tasarımı
- 🌓 Otomatik karanlık/aydınlık tema desteği
- 📱 Android ve iOS platform desteği
- 🔄 Kaydırılabilir liste öğeleri (Flutter Slidable)
- 📈 İstatistik kartı ile günlük özet görünümü
- 🎯 Kategori filtreleme sistemi

### Teknik Detaylar
- Flutter SDK 3.6.1+ kullanılarak geliştirildi
- Provider state management pattern'i uygulandı
- Responsive ve modern UI/UX tasarımı
- Temiz kod mimarisi ve modüler yapı
