# RoutinS 📱

Hayatınızı kategorilere ayırarak planlayın, rutinlerinizi takip edin ve hedeflerinize ulaşın! Modern ve kullanıcı dostu bir yaşam planlama uygulaması.

## ✨ Özellikler

### 🏠 Dashboard (Ana Sayfa)
- 📊 **Kategori Kartları**: Finans, Eğitim, Sağlık, İş kategorileri
- ✅ **Bugünkü Rutinler**: Günlük rutinlerinizi checkbox ile tamamlayın
- 📅 **Yaklaşan Etkinlikler**: Randevular, ödemeler ve deadline'lar

### 📅 Takvim Görünümü
- 📆 **Günlük Görünüm**: Saatlik program ve tamamlama takibi
- 📊 **Haftalık Görünüm**: 7 günlük özet ve etkinlik sayıları
- 🗓️ **Aylık Görünüm**: Takvim grid'i ve etkinlik göstergeleri

### 🎯 Hedefler
- 📈 **İlerleme Takibi**: Progress bar ile görsel ilerleme
- 🏆 **Başarılar**: Milestone sistemi ve tamamlanan hedefler
- 💪 **Motivasyon**: İlham verici mesajlar ve emoji desteği

### ➕ Etkinlik Yönetimi
- 📝 **Tek Seferlik Etkinlikler**: Randevular, ödemeler, hatırlatmalar
- 🔄 **Tekrarlayan Rutinler**: Günlük, haftalık, aylık rutinler
- 🏷️ **Kategori Sistemi**: Renkli kategori organizasyonu
- 📝 **Notlar**: Her etkinlik için detaylı notlar

### 🎨 Tasarım
- 🌈 **Modern UI**: Gradient renkler ve Material Design 3
- 🎨 **Özel Logo**: CustomPainter ile çizilmiş katmanlı logo
- 📱 **Responsive**: Tüm ekran boyutlarına uyumlu
- 🇹🇷 **Türkçe**: Tam Türkçe dil desteği

## 🚀 Kurulum

### Gereksinimler

- Flutter SDK (3.6.1 veya üzeri)
- Dart SDK
- Android Studio / Xcode (mobil geliştirme için)

### Adımlar

1. Repoyu klonlayın:
```bash
git clone https://github.com/rende55/routins.git
cd routins
```

2. Bağımlılıkları yükleyin:
```bash
flutter pub get
```

3. Uygulamayı çalıştırın:
```bash
flutter run
```

## 📱 Desteklenen Platformlar

- ✅ Android (API 21+)
- ✅ iOS (iOS 12+)
- 🔜 Web (Planlanan)

## 🛠️ Kullanılan Teknolojiler

### Frontend
- **Flutter 3.27.2**: Cross-platform UI framework
- **Material Design 3**: Modern tasarım sistemi
- **CustomPainter**: Özel logo çizimi

### State Management
- **Provider 6.1.1**: Reactive state management
- **ChangeNotifier**: State değişiklik bildirimleri

### Data & Storage
- **SharedPreferences 2.2.2**: Local key-value storage
- **intl 0.19.0**: Internationalization ve tarih formatı

### Build & Tools
- **Android Gradle Plugin 8.3.0**: Android build sistemi
- **Gradle 8.4**: Build automation
- **Kotlin 1.9.0**: Android native kod

## 📖 Kullanım

### Etkinlik Ekleme
1. Sağ alttaki **+** (FAB) butonuna tıklayın
2. **Tek Seferlik** veya **Rutin** sekmesini seçin
3. Formu doldurun (başlık, kategori, tarih/saat)
4. **Kaydet** butonuna tıklayın

### Rutin Tamamlama
1. Dashboard'daki rutini bulun
2. Checkbox'a tıklayarak tamamlayın
3. İlerleme otomatik güncellenir

### Takvim Görünümü
1. Alt menüden **Takvim** sekmesine gidin
2. **Günlük**, **Haftalık** veya **Aylık** görünümü seçin
3. Etkinlikleri görüntüleyin ve filtreleyin

### Hedef Takibi
1. Alt menüden **Hedefler** sekmesine gidin
2. Hedeflerinizin ilerlemesini görün
3. Başarılarınızı kutlayın

## 📚 Dokümantasyon

Detaylı dokümantasyon için [`docs/`](docs/) dizinine bakın:

- **[PROJECT_CONCEPT.md](docs/PROJECT_CONCEPT.md)**: Proje konsepti, vizyon ve hedefler
- **[DEVELOPMENT_PLAN.md](docs/DEVELOPMENT_PLAN.md)**: Geliştirme planı ve öncelikler
- **[ARCHITECTURE.md](docs/ARCHITECTURE.md)**: Teknik mimari ve tasarım prensipleri

## 🚀 Geliştirme Durumu

**Versiyon**: 2.0.0  
**Durum**: 🚧 Aktif Geliştirme  
**Tamamlanma**: ~40%

### ✅ Tamamlanan
- UI/UX tasarımı ve implementasyonu
- 3 ana ekran (Dashboard, Calendar, Goals)
- Bottom navigation ve header
- Etkinlik ekleme dialog'u

### 🚧 Devam Eden
- Veri modelleri
- Provider implementasyonu
- Storage servisi

### 📋 Planlanan
- CRUD operasyonları
- Bildirim sistemi
- İstatistikler ve analizler
- Testler

## 📝 Lisans

Bu proje özel bir projedir ve henüz açık kaynak lisansı bulunmamaktadır.

## 👨‍💻 Geliştirici

[@rende55](https://github.com/rende55)

## 🤝 Katkıda Bulunma

Katkılarınızı bekliyoruz! Lütfen bir issue açın veya pull request gönderin.
