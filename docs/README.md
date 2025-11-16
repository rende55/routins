# RoutinS Dokümantasyon

Bu dizin, RoutinS projesinin kapsamlı dokümantasyonunu içerir.

## 📚 Dokümantasyon İçeriği

### 1. [PROJECT_CONCEPT.md](PROJECT_CONCEPT.md)
**Proje Konsepti ve Vizyon**

Bu dokümanda şunları bulabilirsiniz:
- 🎯 Proje vizyonu ve hedefleri
- 🌟 Ana konsept ve felsefe
- 📱 Uygulama yapısı ve özellikler
- 🎨 Tasarım dili ve renk paleti
- 🔧 Teknik mimari genel bakış
- 📊 Veri akışı diyagramları
- 🚀 Gelecek özellikler (roadmap)
- 🎓 Öğrenme hedefleri

**Kimler için?**
- Projeye yeni katılanlar
- Ürün yöneticileri
- Tasarımcılar
- Stakeholder'lar

### 2. [DEVELOPMENT_PLAN.md](DEVELOPMENT_PLAN.md)
**Geliştirme Planı ve Öncelikler**

Bu dokümanda şunları bulabilirsiniz:
- ✅ Tamamlanan özellikler
- ⚠️ Eksik ve geliştirme gereken alanlar
- 📋 Sprint planları (4 haftalık)
- 🎯 Milestone'lar ve hedef tarihler
- 🚧 Bilinen sorunlar ve çözümler
- 📊 Geliştirme metrikleri
- 🔄 Sürekli iyileştirme stratejisi

**Kimler için?**
- Geliştiriciler
- Proje yöneticileri
- Scrum master'lar
- Teknik liderler

### 3. [ARCHITECTURE.md](ARCHITECTURE.md)
**Teknik Mimari ve Tasarım**

Bu dokümanda şunları bulabilirsiniz:
- 🏗️ Genel mimari yapı
- 📁 Proje dizin yapısı
- 🎨 Presentation layer detayları
- 🔄 State management pattern'leri
- 📦 Business logic katmanı
- 💾 Data layer ve storage
- 🔌 Dependency injection
- 🔄 Veri akışı örnekleri
- 🎯 Tasarım prensipleri (SOLID, DRY, KISS)

**Kimler için?**
- Geliştiriciler
- Sistem mimarları
- Code reviewer'lar
- Teknik danışmanlar

## 🚀 Hızlı Başlangıç

### Yeni Geliştiriciler İçin

1. **İlk olarak okuyun**: [PROJECT_CONCEPT.md](PROJECT_CONCEPT.md)
   - Projenin ne olduğunu anlayın
   - Temel özellikleri öğrenin
   - Hedef kitleyi tanıyın

2. **Sonra okuyun**: [ARCHITECTURE.md](ARCHITECTURE.md)
   - Kod yapısını anlayın
   - Katmanları öğrenin
   - Veri akışını kavrayın

3. **Son olarak okuyun**: [DEVELOPMENT_PLAN.md](DEVELOPMENT_PLAN.md)
   - Neyin tamamlandığını görün
   - Neyin eksik olduğunu öğrenin
   - Hangi task'lara başlayabileceğinizi belirleyin

### Proje Yöneticileri İçin

1. **İlk olarak okuyun**: [PROJECT_CONCEPT.md](PROJECT_CONCEPT.md)
   - Roadmap'i inceleyin
   - Milestone'ları görün
   - Başarı metriklerini anlayın

2. **Sonra okuyun**: [DEVELOPMENT_PLAN.md](DEVELOPMENT_PLAN.md)
   - Sprint planlarını gözden geçirin
   - Öncelikleri belirleyin
   - Zaman tahminlerini değerlendirin

## 📊 Proje Durumu

### Mevcut Versiyon: 2.0.0

**Tamamlanma Oranı**: ~40%

#### ✅ Tamamlanan
- UI/UX tasarımı ve implementasyonu
- 3 ana ekran (Dashboard, Calendar, Goals)
- Etkinlik ekleme dialog'u
- Temel navigasyon yapısı
- Tema ve renk sistemi

#### 🚧 Devam Eden
- Veri modelleri oluşturma
- Provider implementasyonu
- Storage servisi

#### 📋 Planlanan
- CRUD operasyonları
- Bildirim sistemi
- İstatistikler
- Testler

## 🎯 Öncelikli Görevler

### Sprint 1 (Bu Hafta)
1. Event model sınıfı oluştur
2. Routine model sınıfını güncelle
3. Goal model sınıfı oluştur
4. EventProvider implementasyonu
5. StorageService temel yapısı

### Sprint 2 (Gelecek Hafta)
1. Etkinlik ekleme fonksiyonu
2. Etkinlik listeleme
3. Rutin tamamlama
4. Veri persistence

## 📖 Ek Kaynaklar

### Flutter Dokümantasyonu
- [Flutter Official Docs](https://docs.flutter.dev/)
- [Provider Package](https://pub.dev/packages/provider)
- [SharedPreferences](https://pub.dev/packages/shared_preferences)

### Tasarım Kaynakları
- [Material Design 3](https://m3.material.io/)
- [Flutter Widget Catalog](https://docs.flutter.dev/ui/widgets)

### State Management
- [Provider Pattern Guide](https://flutter.dev/docs/development/data-and-backend/state-mgmt/simple)
- [ChangeNotifier Class](https://api.flutter.dev/flutter/foundation/ChangeNotifier-class.html)

## 🤝 Katkıda Bulunma

Dokümantasyona katkıda bulunmak isterseniz:

1. Dokümantasyon eksikliği bulduysanız issue açın
2. Düzeltme önerilerinizi pull request olarak gönderin
3. Yeni bölümler eklemek isterseniz önce tartışma açın

### Dokümantasyon Kuralları

- Markdown formatı kullanın
- Başlıkları hiyerarşik yapılandırın
- Kod örnekleri ekleyin
- Diyagramlar kullanın (mermaid.js)
- Emoji'lerle görselleştirin (ama abartmayın)
- Türkçe dilbilgisi kurallarına uyun

## 📝 Güncelleme Geçmişi

### 17 Kasım 2025
- İlk dokümantasyon oluşturuldu
- 3 ana dokuman eklendi
- README hazırlandı

## 📧 İletişim

Sorularınız için:
- GitHub Issues: [routins/issues](https://github.com/rende55/routins/issues)
- Email: [İletişim bilgisi eklenecek]

---

**Son Güncelleme**: 17 Kasım 2025
**Durum**: Aktif Geliştirme
