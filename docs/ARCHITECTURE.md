# RoutinS - Mimari Dokümantasyon

## 🏗️ Genel Mimari

RoutinS, **Clean Architecture** prensiplerine dayalı, katmanlı bir yapıya sahiptir.

```
┌─────────────────────────────────────────────────────────┐
│                    Presentation Layer                    │
│  ┌─────────────┐  ┌─────────────┐  ┌─────────────┐     │
│  │   Screens   │  │   Widgets   │  │   Dialogs   │     │
│  └─────────────┘  └─────────────┘  └─────────────┘     │
└─────────────────────────────────────────────────────────┘
                           ↓
┌─────────────────────────────────────────────────────────┐
│                   State Management                       │
│  ┌─────────────┐  ┌─────────────┐  ┌─────────────┐     │
│  │  Providers  │  │ChangeNotify│  │   Listeners │     │
│  └─────────────┘  └─────────────┘  └─────────────┘     │
└─────────────────────────────────────────────────────────┘
                           ↓
┌─────────────────────────────────────────────────────────┐
│                     Business Logic                       │
│  ┌─────────────┐  ┌─────────────┐  ┌─────────────┐     │
│  │   Models    │  │  Validators │  │   Utils     │     │
│  └─────────────┘  └─────────────┘  └─────────────┘     │
└─────────────────────────────────────────────────────────┘
                           ↓
┌─────────────────────────────────────────────────────────┐
│                      Data Layer                          │
│  ┌─────────────┐  ┌─────────────┐  ┌─────────────┐     │
│  │  Services   │  │ Repositories│  │   Storage   │     │
│  └─────────────┘  └─────────────┘  └─────────────┘     │
└─────────────────────────────────────────────────────────┘
```

## 📁 Proje Yapısı

```
lib/
├── main.dart                    # Uygulama giriş noktası
├── models/                      # Veri modelleri
│   ├── event.dart              # Etkinlik modeli
│   ├── routine.dart            # Rutin modeli (mevcut)
│   ├── goal.dart               # Hedef modeli
│   ├── category.dart           # Kategori modeli
│   └── milestone.dart          # Başarı modeli
├── providers/                   # State management
│   ├── event_provider.dart     # Etkinlik state yönetimi
│   ├── routine_provider.dart   # Rutin state yönetimi (mevcut)
│   ├── goal_provider.dart      # Hedef state yönetimi
│   └── category_provider.dart  # Kategori state yönetimi
├── screens/                     # Ana ekranlar
│   ├── dashboard_screen.dart   # Ana sayfa
│   ├── calendar_screen.dart    # Takvim görünümü
│   ├── goals_screen.dart       # Hedefler sayfası
│   └── settings_screen.dart    # Ayarlar (gelecek)
├── widgets/                     # Yeniden kullanılabilir bileşenler
│   ├── add_event_dialog.dart   # Etkinlik ekleme dialog'u
│   ├── routine_card.dart       # Rutin kartı (mevcut)
│   ├── stats_card.dart         # İstatistik kartı (mevcut)
│   ├── category_card.dart      # Kategori kartı
│   ├── event_card.dart         # Etkinlik kartı
│   └── goal_card.dart          # Hedef kartı
├── services/                    # İş mantığı servisleri
│   ├── storage_service.dart    # Veri saklama servisi
│   ├── notification_service.dart # Bildirim servisi
│   └── analytics_service.dart  # Analitik servisi (gelecek)
├── utils/                       # Yardımcı fonksiyonlar
│   ├── constants.dart          # Sabitler
│   ├── date_utils.dart         # Tarih yardımcıları
│   ├── validators.dart         # Validation fonksiyonları
│   └── extensions.dart         # Dart extensions
└── theme/                       # Tema ve stil
    ├── app_theme.dart          # Ana tema
    ├── colors.dart             # Renk paleti
    └── text_styles.dart        # Metin stilleri
```

## 🎨 Presentation Layer (UI Katmanı)

### Screens (Ekranlar)

#### MainScreen
**Sorumluluk**: Ana navigasyon ve layout
**Bileşenler**:
- Bottom Navigation Bar
- Gradient Header
- Floating Action Button
- Screen routing

**State**: StatefulWidget (navigation index)

#### DashboardScreen
**Sorumluluk**: Genel bakış ve hızlı erişim
**Bileşenler**:
- Welcome section
- Category grid
- Today's routines list
- Upcoming events list

**State**: StatefulWidget (locale initialization)
**Provider Dependencies**: EventProvider, RoutineProvider

#### CalendarScreen
**Sorumluluk**: Takvim görünümleri
**Bileşenler**:
- Tab controller (Günlük, Haftalık, Aylık)
- Calendar grid
- Event list
- Filter button

**State**: StatefulWidget (tab controller, selected date)
**Provider Dependencies**: EventProvider, RoutineProvider

#### GoalsScreen
**Sorumluluk**: Hedef takibi
**Bileşenler**:
- Goal overview cards
- Goal list with progress
- Milestones list
- Motivation card

**State**: StatelessWidget
**Provider Dependencies**: GoalProvider

### Widgets (Bileşenler)

#### AddEventDialog
**Sorumluluk**: Etkinlik/rutin ekleme formu
**Props**:
- onSave: (Event/Routine) → void
- initialData: Event/Routine? (edit için)

**State**: StatefulWidget (form state, tab controller)

#### CategoryCard
**Sorumluluk**: Kategori gösterimi
**Props**:
- category: Category
- onTap: () → void

**State**: StatelessWidget

#### EventCard
**Sorumluluk**: Etkinlik gösterimi
**Props**:
- event: Event
- onTap: () → void
- onComplete: () → void

**State**: StatelessWidget

## 🔄 State Management Layer

### Provider Pattern

RoutinS, **Provider** paketini kullanarak state management yapar.

#### EventProvider
```dart
class EventProvider extends ChangeNotifier {
  List<Event> _events = [];
  
  // Getters
  List<Event> get events => _events;
  List<Event> get upcomingEvents => _getUpcomingEvents();
  List<Event> getEventsByDate(DateTime date) => _getEventsByDate(date);
  
  // CRUD Operations
  Future<void> addEvent(Event event) async { }
  Future<void> updateEvent(Event event) async { }
  Future<void> deleteEvent(String id) async { }
  Future<void> toggleEventCompletion(String id) async { }
  
  // Filtering & Sorting
  List<Event> filterByCategory(String category) { }
  List<Event> filterByType(String type) { }
  List<Event> sortByDate() { }
  
  // Storage
  Future<void> loadEvents() async { }
  Future<void> saveEvents() async { }
}
```

#### RoutineProvider
```dart
class RoutineProvider extends ChangeNotifier {
  List<Routine> _routines = [];
  
  // Getters
  List<Routine> get routines => _routines;
  List<Routine> get todayRoutines => _getTodayRoutines();
  
  // CRUD Operations
  Future<void> addRoutine(Routine routine) async { }
  Future<void> updateRoutine(Routine routine) async { }
  Future<void> deleteRoutine(String id) async { }
  
  // Completion Tracking
  Future<void> markAsCompleted(String id, DateTime date) async { }
  bool isCompletedToday(String id) { }
  int getStreak(String id) { }
  
  // Storage
  Future<void> loadRoutines() async { }
  Future<void> saveRoutines() async { }
}
```

#### GoalProvider
```dart
class GoalProvider extends ChangeNotifier {
  List<Goal> _goals = [];
  
  // Getters
  List<Goal> get goals => _goals;
  double get averageProgress => _calculateAverageProgress();
  
  // CRUD Operations
  Future<void> addGoal(Goal goal) async { }
  Future<void> updateGoal(Goal goal) async { }
  Future<void> deleteGoal(String id) async { }
  
  // Progress Tracking
  Future<void> updateProgress(String id, double value) async { }
  Future<void> addMilestone(String goalId, Milestone milestone) async { }
  
  // Storage
  Future<void> loadGoals() async { }
  Future<void> saveGoals() async { }
}
```

### Provider Hierarchy

```dart
void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => EventProvider()),
        ChangeNotifierProvider(create: (_) => RoutineProvider()),
        ChangeNotifierProvider(create: (_) => GoalProvider()),
        ChangeNotifierProvider(create: (_) => CategoryProvider()),
      ],
      child: MyApp(),
    ),
  );
}
```

## 📦 Business Logic Layer

### Models

#### Event Model
```dart
class Event {
  final String id;
  final String title;
  final String category;
  final DateTime dateTime;
  final EventType type;
  final String? notes;
  final bool isCompleted;
  
  Event({...});
  
  // Serialization
  factory Event.fromJson(Map<String, dynamic> json) { }
  Map<String, dynamic> toJson() { }
  
  // Utility
  Event copyWith({...}) { }
  @override String toString() { }
  @override bool operator ==(Object other) { }
  @override int get hashCode { }
}

enum EventType {
  appointment,
  payment,
  deadline,
  reminder,
  other,
}
```

#### Routine Model
```dart
class Routine {
  final String id;
  final String title;
  final String category;
  final TimeOfDay time;
  final Frequency frequency;
  final DateTime startDate;
  final DateTime? endDate;
  final String? notes;
  final List<DateTime> completedDates;
  
  Routine({...});
  
  // Serialization
  factory Routine.fromJson(Map<String, dynamic> json) { }
  Map<String, dynamic> toJson() { }
  
  // Business Logic
  bool isScheduledFor(DateTime date) { }
  bool isCompletedOn(DateTime date) { }
  int getStreak() { }
  double getCompletionRate() { }
}

enum Frequency {
  daily,
  weekdays,
  weekends,
  weekly,
  biweekly,
  monthly,
}
```

#### Goal Model
```dart
class Goal {
  final String id;
  final String title;
  final String category;
  final String icon;
  final double current;
  final double target;
  final String unit;
  final DateTime deadline;
  final List<Milestone> milestones;
  
  Goal({...});
  
  // Serialization
  factory Goal.fromJson(Map<String, dynamic> json) { }
  Map<String, dynamic> toJson() { }
  
  // Business Logic
  double get progress => (current / target * 100).clamp(0, 100);
  bool get isCompleted => current >= target;
  int get daysRemaining => deadline.difference(DateTime.now()).inDays;
  Milestone? get nextMilestone => _getNextMilestone();
}
```

### Validators

```dart
class Validators {
  static String? validateTitle(String? value) {
    if (value == null || value.isEmpty) {
      return 'Başlık boş olamaz';
    }
    if (value.length < 3) {
      return 'Başlık en az 3 karakter olmalı';
    }
    return null;
  }
  
  static String? validateDate(DateTime? value) {
    if (value == null) {
      return 'Tarih seçilmeli';
    }
    return null;
  }
  
  static String? validateGoalValue(double? current, double? target) {
    if (current == null || target == null) {
      return 'Değerler girilmeli';
    }
    if (target <= 0) {
      return 'Hedef değer 0\'dan büyük olmalı';
    }
    if (current < 0) {
      return 'Mevcut değer negatif olamaz';
    }
    return null;
  }
}
```

## 💾 Data Layer

### Storage Service

```dart
class StorageService {
  static const String _eventsKey = 'events';
  static const String _routinesKey = 'routines';
  static const String _goalsKey = 'goals';
  
  final SharedPreferences _prefs;
  
  StorageService(this._prefs);
  
  // Generic Methods
  Future<void> saveList<T>(String key, List<T> items, 
      Map<String, dynamic> Function(T) toJson) async {
    final jsonList = items.map(toJson).toList();
    await _prefs.setString(key, jsonEncode(jsonList));
  }
  
  Future<List<T>> loadList<T>(String key, 
      T Function(Map<String, dynamic>) fromJson) async {
    final jsonString = _prefs.getString(key);
    if (jsonString == null) return [];
    
    final jsonList = jsonDecode(jsonString) as List;
    return jsonList.map((json) => fromJson(json)).toList();
  }
  
  // Specific Methods
  Future<void> saveEvents(List<Event> events) async {
    await saveList(_eventsKey, events, (e) => e.toJson());
  }
  
  Future<List<Event>> loadEvents() async {
    return loadList(_eventsKey, Event.fromJson);
  }
  
  // Clear Data
  Future<void> clearAll() async {
    await _prefs.clear();
  }
}
```

### Notification Service

```dart
class NotificationService {
  final FlutterLocalNotificationsPlugin _notifications;
  
  NotificationService(this._notifications);
  
  Future<void> initialize() async {
    const androidSettings = AndroidInitializationSettings('@mipmap/ic_launcher');
    const iosSettings = DarwinInitializationSettings();
    
    await _notifications.initialize(
      const InitializationSettings(
        android: androidSettings,
        iOS: iosSettings,
      ),
    );
  }
  
  Future<void> scheduleEventNotification(Event event) async {
    await _notifications.zonedSchedule(
      event.id.hashCode,
      event.title,
      event.notes ?? 'Etkinlik zamanı geldi',
      _convertToTZDateTime(event.dateTime),
      _notificationDetails(),
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
    );
  }
  
  Future<void> scheduleRoutineNotification(Routine routine) async {
    // Tekrarlayan bildirim mantığı
  }
  
  Future<void> cancelNotification(int id) async {
    await _notifications.cancel(id);
  }
}
```

## 🔌 Dependency Injection

```dart
// services/service_locator.dart
final getIt = GetIt.instance;

void setupServiceLocator() {
  // Services
  getIt.registerLazySingleton<StorageService>(
    () => StorageService(getIt<SharedPreferences>()),
  );
  
  getIt.registerLazySingleton<NotificationService>(
    () => NotificationService(FlutterLocalNotificationsPlugin()),
  );
  
  // Providers
  getIt.registerFactory<EventProvider>(
    () => EventProvider(getIt<StorageService>()),
  );
  
  getIt.registerFactory<RoutineProvider>(
    () => RoutineProvider(getIt<StorageService>()),
  );
}
```

## 🔄 Veri Akışı Örnekleri

### Etkinlik Ekleme Akışı

```
1. Kullanıcı FAB'a tıklar
   ↓
2. AddEventDialog açılır
   ↓
3. Form doldurulur ve validate edilir
   ↓
4. onSave callback çağrılır
   ↓
5. EventProvider.addEvent() çağrılır
   ↓
6. Event listesine eklenir
   ↓
7. StorageService.saveEvents() çağrılır
   ↓
8. notifyListeners() çağrılır
   ↓
9. UI otomatik güncellenir (Consumer widgets)
   ↓
10. NotificationService.scheduleEventNotification() çağrılır
```

### Rutin Tamamlama Akışı

```
1. Kullanıcı checkbox'a tıklar
   ↓
2. onChanged callback çağrılır
   ↓
3. RoutineProvider.markAsCompleted() çağrılır
   ↓
4. completedDates listesine eklenir
   ↓
5. Streak hesaplanır
   ↓
6. StorageService.saveRoutines() çağrılır
   ↓
7. notifyListeners() çağrılır
   ↓
8. UI güncellenir (checkbox, progress, stats)
```

## 🎯 Tasarım Prensipleri

### SOLID Principles

- **Single Responsibility**: Her sınıf tek bir sorumluluğa sahip
- **Open/Closed**: Extension'a açık, modification'a kapalı
- **Liskov Substitution**: Alt sınıflar üst sınıfların yerine kullanılabilir
- **Interface Segregation**: Küçük ve spesifik interface'ler
- **Dependency Inversion**: Abstraction'lara bağımlı ol

### DRY (Don't Repeat Yourself)

- Ortak widget'lar için reusable components
- Ortak fonksiyonlar için utility classes
- Ortak stiller için theme system

### KISS (Keep It Simple, Stupid)

- Basit ve anlaşılır kod
- Gereksiz complexity'den kaçın
- Okunabilirlik öncelikli

---

**Son Güncelleme**: 17 Kasım 2025
**Versiyon**: 2.0.0
