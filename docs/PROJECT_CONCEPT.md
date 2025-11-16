# RoutinS - Proje Konsepti ve Vizyon

## 📋 Genel Bakış

**RoutinS**, kullanıcıların hayatlarını kategorilere ayırarak planlayabilecekleri, rutinlerini takip edebilecekleri ve hedeflerine ulaşabilecekleri kapsamlı bir yaşam planlama uygulamasıdır.

## 🎯 Proje Vizyonu

Kullanıcıların hayatlarının farklı alanlarını (finans, eğitim, sağlık, iş) organize etmelerine yardımcı olan, modern ve kullanıcı dostu bir mobil uygulama geliştirmek.

## 🌟 Ana Konsept

### Temel Felsefe
- **Kategori Bazlı Organizasyon**: Hayatın farklı alanlarını ayrı kategorilerde yönetme
- **Esneklik**: Hem tek seferlik etkinlikler hem de tekrarlayan rutinler
- **Görselleştirme**: Günlük, haftalık ve aylık görünümlerle ilerleme takibi
- **Motivasyon**: Hedef takibi ve başarı sistemi ile kullanıcı motivasyonu

### Hedef Kitle
- Hayatını organize etmek isteyen profesyoneller
- Hedeflerine ulaşmak için planlama yapan bireyler
- Rutin oluşturmak isteyen öğrenciler
- Finansal ve kişisel gelişim takibi yapanlar

## 📱 Uygulama Yapısı

### 1. **Dashboard (Ana Sayfa)**
**Amaç**: Kullanıcıya günlük genel bakış sunmak

**Özellikler**:
- Hoş geldin mesajı ve güncel tarih
- 4 ana kategori kartı (Finans, Eğitim, Sağlık, İş)
- Bugünkü rutinler listesi (checkbox ile tamamlama)
- Yaklaşan etkinlikler (randevular, ödemeler, deadline'lar)

**Kullanıcı Deneyimi**:
- Hızlı erişim: Kullanıcı açılışta en önemli bilgileri görür
- Tamamlama kolaylığı: Checkbox ile hızlı işaretleme
- Önceliklendirme: Yaklaşan etkinlikler tarihe göre sıralı

### 2. **Takvim Görünümü**
**Amaç**: Zaman bazlı planlama ve görselleştirme

**Özellikler**:
- **Günlük Görünüm**: Saatlik program, checkbox ile tamamlama
- **Haftalık Görünüm**: 7 günlük özet, her gün için etkinlik sayısı
- **Aylık Görünüm**: Takvim grid'i, etkinlik göstergeleri

**Kullanıcı Deneyimi**:
- Esnek görünüm: İhtiyaca göre zoom seviyesi değiştirme
- Renk kodlama: Kategorilere göre renkli göstergeler
- Filtreleme: Kategori bazlı filtreleme imkanı

### 3. **Hedefler**
**Amaç**: Uzun vadeli hedef takibi ve motivasyon

**Özellikler**:
- Hedef kartları (emoji, başlık, kategori, ilerleme)
- Progress bar ile görsel ilerleme
- Başarılar (milestone) listesi
- Motivasyon kartı (ilham verici mesajlar)

**Kullanıcı Deneyimi**:
- Görsel feedback: İlerleme çubuğu ve yüzde gösterimi
- Başarı hissi: Tamamlanan milestone'lar
- Motivasyon: Pozitif mesajlar ve emoji kullanımı

### 4. **Etkinlik Ekleme**
**Amaç**: Kolay ve hızlı etkinlik/rutin oluşturma

**Özellikler**:
- İki mod: Tek seferlik / Rutin
- Kategori seçimi (görsel butonlar)
- Tarih ve saat seçici
- Tekrar sıklığı (rutinler için)
- Notlar alanı

**Kullanıcı Deneyimi**:
- Basit form: Minimum adımda oluşturma
- Görsel seçim: İkonlu kategori butonları
- Esneklik: Opsiyonel alanlar

## 🎨 Tasarım Dili

### Renk Paleti
- **Ana Renkler**: Indigo (#4F46E5) - Purple (#7C3AED) gradient
- **Kategori Renkleri**:
  - Finans: Emerald (#10B981)
  - Eğitim: Blue (#3B82F6)
  - Sağlık: Rose (#F43F5E)
  - İş: Amber (#F59E0B)
- **Nötr Renkler**: Slate tonları (#0F172A - #F8FAFC)

### Tipografi
- Başlıklar: 18-24px, font-weight: 600
- Gövde metni: 14-16px, font-weight: 400-500
- Küçük metin: 12px (tarih, saat, badge'ler)

### Bileşenler
- **Card**: Rounded 12px, elevation 0, border subtle
- **Button**: Rounded 8-12px, gradient veya solid
- **Input**: Rounded 8px, border 1px
- **Badge**: Rounded 8px, küçük padding

## 🔧 Teknik Mimari

### Katmanlar
```
┌─────────────────────────────────┐
│         UI Layer (Screens)       │
│  Dashboard, Calendar, Goals      │
└─────────────────────────────────┘
           ↓
┌─────────────────────────────────┐
│      State Management            │
│      (Provider Pattern)          │
└─────────────────────────────────┘
           ↓
┌─────────────────────────────────┐
│         Models                   │
│  Event, Routine, Goal, Category  │
└─────────────────────────────────┘
           ↓
┌─────────────────────────────────┐
│      Data Persistence            │
│    (SharedPreferences / SQLite)  │
└─────────────────────────────────┘
```

### Veri Modelleri (Planlanıyor)

#### Event (Etkinlik)
```dart
class Event {
  String id;
  String title;
  String category;
  DateTime dateTime;
  String type; // appointment, payment, deadline, reminder
  String? notes;
  bool isCompleted;
}
```

#### Routine (Rutin)
```dart
class Routine {
  String id;
  String title;
  String category;
  TimeOfDay time;
  String frequency; // daily, weekdays, weekends, weekly, monthly
  DateTime startDate;
  DateTime? endDate;
  String? notes;
  List<DateTime> completedDates;
}
```

#### Goal (Hedef)
```dart
class Goal {
  String id;
  String title;
  String category;
  String icon;
  double current;
  double target;
  String unit;
  DateTime deadline;
  List<Milestone> milestones;
}
```

#### Category (Kategori)
```dart
class Category {
  String id;
  String name;
  IconData icon;
  Color color;
  int eventCount;
}
```

## 📊 Veri Akışı

### Etkinlik Ekleme Akışı
```
Kullanıcı FAB'a tıklar
    ↓
Dialog açılır (Tek seferlik / Rutin seçimi)
    ↓
Form doldurulur (başlık, kategori, tarih/saat)
    ↓
Kaydet butonuna tıklanır
    ↓
Provider'a eklenir
    ↓
Local storage'a kaydedilir
    ↓
UI güncellenir (Dashboard, Calendar)
```

### Rutin Tamamlama Akışı
```
Kullanıcı checkbox'a tıklar
    ↓
Provider state güncellenir
    ↓
completedDates listesine eklenir
    ↓
Local storage güncellenir
    ↓
UI güncellenir (progress, stats)
```

## 🚀 Gelecek Özellikler (Roadmap)

### Faz 1: Temel Özellikler (Mevcut)
- ✅ Dashboard ekranı
- ✅ Takvim görünümleri
- ✅ Hedefler ekranı
- ✅ Etkinlik ekleme dialog'u
- ✅ Kategori sistemi

### Faz 2: Veri Yönetimi (Öncelikli)
- [ ] Model sınıfları oluşturma
- [ ] Provider implementasyonu
- [ ] Local storage (SharedPreferences/SQLite)
- [ ] CRUD operasyonları
- [ ] Veri persistence

### Faz 3: Gelişmiş Özellikler
- [ ] Bildirimler (reminder sistemi)
- [ ] Widget'lar (home screen widget)
- [ ] İstatistikler ve analizler
- [ ] Veri export/import
- [ ] Tema özelleştirme

### Faz 4: Sosyal ve Bulut
- [ ] Kullanıcı hesapları
- [ ] Bulut senkronizasyonu
- [ ] Sosyal paylaşım
- [ ] Arkadaşlarla yarışma
- [ ] Başarı rozetleri

### Faz 5: Yapay Zeka
- [ ] Akıllı öneri sistemi
- [ ] Rutin optimizasyonu
- [ ] Hedef önerileri
- [ ] Davranış analizi

## 🎯 Başarı Metrikleri

### Kullanıcı Deneyimi
- Uygulama açılış süresi < 2 saniye
- Etkinlik ekleme < 30 saniye
- Günlük aktif kullanım > 5 dakika
- Kullanıcı memnuniyeti > 4.5/5

### Teknik Performans
- Frame rate > 60 FPS
- Memory kullanımı < 100 MB
- Battery drain < %5/saat
- Crash rate < %0.1

## 💡 Tasarım Prensipleri

1. **Basitlik**: Minimum adımda maksimum sonuç
2. **Görsellik**: Her şey görsel feedback ile desteklenmeli
3. **Esneklik**: Kullanıcı ihtiyaçlarına göre özelleştirilebilir
4. **Motivasyon**: Kullanıcıyı sürekli motive eden elementler
5. **Güvenilirlik**: Veri kaybı olmamalı, her zaman senkron

## 🔐 Güvenlik ve Gizlilik

- Tüm veriler cihazda local olarak saklanır
- Hassas veriler şifrelenir
- Kullanıcı izni olmadan veri paylaşılmaz
- GDPR ve KVKK uyumlu

## 📱 Platform Desteği

### Öncelikli
- Android (API 21+)
- iOS (iOS 12+)

### Gelecek
- Web (Progressive Web App)
- Desktop (Windows, macOS, Linux)
- Wearables (Apple Watch, Wear OS)

## 🎓 Öğrenme Hedefleri

Bu proje aynı zamanda şu teknolojileri öğrenmek için kullanılıyor:
- Flutter state management (Provider)
- Local data persistence
- Complex UI animations
- Custom painters ve drawings
- Date/time handling
- Notification scheduling
- Platform-specific features

---

**Son Güncelleme**: 17 Kasım 2025
**Versiyon**: 2.0.0
**Durum**: Aktif Geliştirme
