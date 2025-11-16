class Routine {
  final String id;
  final String title;
  final String? description;
  final String category;
  final List<bool> completedDays; // Son 7 gün için tamamlanma durumu
  final DateTime createdAt;
  bool isCompletedToday;

  Routine({
    required this.id,
    required this.title,
    this.description,
    required this.category,
    required this.completedDays,
    required this.createdAt,
    this.isCompletedToday = false,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'category': category,
      'completedDays': completedDays,
      'createdAt': createdAt.toIso8601String(),
      'isCompletedToday': isCompletedToday,
    };
  }

  factory Routine.fromJson(Map<String, dynamic> json) {
    return Routine(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      category: json['category'],
      completedDays: List<bool>.from(json['completedDays']),
      createdAt: DateTime.parse(json['createdAt']),
      isCompletedToday: json['isCompletedToday'] ?? false,
    );
  }

  Routine copyWith({
    String? id,
    String? title,
    String? description,
    String? category,
    List<bool>? completedDays,
    DateTime? createdAt,
    bool? isCompletedToday,
  }) {
    return Routine(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      category: category ?? this.category,
      completedDays: completedDays ?? this.completedDays,
      createdAt: createdAt ?? this.createdAt,
      isCompletedToday: isCompletedToday ?? this.isCompletedToday,
    );
  }

  int get streak {
    int count = 0;
    for (int i = completedDays.length - 1; i >= 0; i--) {
      if (completedDays[i]) {
        count++;
      } else {
        break;
      }
    }
    return count;
  }
}
