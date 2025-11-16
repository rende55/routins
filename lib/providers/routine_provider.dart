import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/routine.dart';

class RoutineProvider with ChangeNotifier {
  List<Routine> _routines = [];
  String _selectedCategory = 'Tümü';

  List<Routine> get routines {
    if (_selectedCategory == 'Tümü') {
      return _routines;
    }
    return _routines.where((r) => r.category == _selectedCategory).toList();
  }

  String get selectedCategory => _selectedCategory;

  List<String> get categories {
    final cats = _routines.map((r) => r.category).toSet().toList();
    cats.insert(0, 'Tümü');
    return cats;
  }

  int get totalRoutines => _routines.length;
  
  int get completedToday => _routines.where((r) => r.isCompletedToday).length;

  double get completionRate {
    if (_routines.isEmpty) return 0;
    return completedToday / _routines.length;
  }

  RoutineProvider() {
    loadRoutines();
  }

  void setCategory(String category) {
    _selectedCategory = category;
    notifyListeners();
  }

  Future<void> loadRoutines() async {
    final prefs = await SharedPreferences.getInstance();
    final String? routinesJson = prefs.getString('routines');
    
    if (routinesJson != null) {
      final List<dynamic> decoded = json.decode(routinesJson);
      _routines = decoded.map((item) => Routine.fromJson(item)).toList();
      
      // Bugünün tarihini kontrol et ve gerekirse sıfırla
      final today = DateTime.now();
      final lastUpdate = prefs.getString('lastUpdate');
      
      if (lastUpdate == null || !_isSameDay(DateTime.parse(lastUpdate), today)) {
        // Yeni güne geçildi, tamamlanma durumlarını güncelle
        for (var routine in _routines) {
          routine.completedDays.removeAt(0);
          routine.completedDays.add(routine.isCompletedToday);
          routine.isCompletedToday = false;
        }
        await prefs.setString('lastUpdate', today.toIso8601String());
        await saveRoutines();
      }
      
      notifyListeners();
    }
  }

  bool _isSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }

  Future<void> saveRoutines() async {
    final prefs = await SharedPreferences.getInstance();
    final String encoded = json.encode(_routines.map((r) => r.toJson()).toList());
    await prefs.setString('routines', encoded);
  }

  Future<void> addRoutine(Routine routine) async {
    _routines.add(routine);
    await saveRoutines();
    notifyListeners();
  }

  Future<void> updateRoutine(Routine routine) async {
    final index = _routines.indexWhere((r) => r.id == routine.id);
    if (index != -1) {
      _routines[index] = routine;
      await saveRoutines();
      notifyListeners();
    }
  }

  Future<void> deleteRoutine(String id) async {
    _routines.removeWhere((r) => r.id == id);
    await saveRoutines();
    notifyListeners();
  }

  Future<void> toggleRoutineCompletion(String id) async {
    final routine = _routines.firstWhere((r) => r.id == id);
    routine.isCompletedToday = !routine.isCompletedToday;
    await saveRoutines();
    notifyListeners();
  }
}
