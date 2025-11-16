import 'package:flutter/material.dart';

class GoalsScreen extends StatelessWidget {
  const GoalsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hedeflerim 🎯',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF0F172A),
                ),
              ),
              SizedBox(height: 4),
              Text(
                'İlerlemenizi takip edin',
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF64748B),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),

          // Goals Overview
          Row(
            children: [
              Expanded(
                child: Card(
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [
                          Color(0xFFEEF2FF), // indigo-50
                          Color(0xFFF5F3FF), // purple-50
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 32,
                          height: 32,
                          decoration: BoxDecoration(
                            color: const Color(0xFF4F46E5),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Icon(
                            Icons.track_changes,
                            color: Colors.white,
                            size: 16,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Toplam Hedef',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF0F172A),
                          ),
                        ),
                        const SizedBox(height: 4),
                        const Text(
                          '4 Aktif',
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFF64748B),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Card(
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [
                          Color(0xFFECFDF5), // emerald-50
                          Color(0xFFF0FDFA), // teal-50
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 32,
                          height: 32,
                          decoration: BoxDecoration(
                            color: const Color(0xFF10B981),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Icon(
                            Icons.trending_up,
                            color: Colors.white,
                            size: 16,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Ortalama İlerleme',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF0F172A),
                          ),
                        ),
                        const SizedBox(height: 4),
                        const Text(
                          '72%',
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFF64748B),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),

          // Active Goals
          const Text(
            'Aktif Hedefler',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Color(0xFF0F172A),
            ),
          ),
          const SizedBox(height: 12),
          const GoalCard(
            icon: '💰',
            title: '10.000 TL Tasarruf',
            category: 'Finans',
            categoryColor: Color(0xFF10B981),
            current: 6500,
            target: 10000,
            deadline: '31 Ara 2025',
            unit: 'TL',
          ),
          const SizedBox(height: 12),
          const GoalCard(
            icon: '📚',
            title: '50 Kitap Okuma',
            category: 'Eğitim',
            categoryColor: Color(0xFF3B82F6),
            current: 32,
            target: 50,
            deadline: '31 Ara 2025',
            unit: '',
          ),
          const SizedBox(height: 12),
          const GoalCard(
            icon: '🧘',
            title: '100 Yoga Seansı',
            category: 'Sağlık',
            categoryColor: Color(0xFFF43F5E),
            current: 78,
            target: 100,
            deadline: '31 Ara 2025',
            unit: '',
          ),
          const SizedBox(height: 12),
          const GoalCard(
            icon: '💻',
            title: 'Web Projesi Tamamla',
            category: 'İş',
            categoryColor: Color(0xFFF59E0B),
            current: 8,
            target: 10,
            deadline: '30 Kas 2025',
            unit: '',
          ),
          const SizedBox(height: 24),

          // Milestones
          const Text(
            'Başarılar 🏆',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Color(0xFF0F172A),
            ),
          ),
          const SizedBox(height: 12),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  _buildMilestone(
                    title: '5.000 TL tasarruf edildi',
                    date: '15 Eyl',
                    completed: true,
                    isLast: false,
                  ),
                  _buildMilestone(
                    title: '25 kitap okundu',
                    date: '10 Ağu',
                    completed: true,
                    isLast: false,
                  ),
                  _buildMilestone(
                    title: '50 yoga seansı tamamlandı',
                    date: '20 Tem',
                    completed: true,
                    isLast: false,
                  ),
                  _buildMilestone(
                    title: 'İlk müşteri projesi teslim edildi',
                    date: '05 Haz',
                    completed: true,
                    isLast: true,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),

          // Motivation Card
          Card(
            child: Container(
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFF4F46E5), // indigo-600
                    Color(0xFF7C3AED), // purple-600
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.all(24),
              child: const Column(
                children: [
                  Text(
                    '🌟',
                    style: TextStyle(fontSize: 32),
                  ),
                  SizedBox(height: 8),
                  Text(
                    '"Küçük adımlar büyük değişimler yaratır"',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Hedefinize %72 yakınsınız!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFFC7D2FE),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 80), // Space for FAB
        ],
      ),
    );
  }

  Widget _buildMilestone({
    required String title,
    required String date,
    required bool completed,
    required bool isLast,
  }) {
    return Column(
      children: [
        Row(
          children: [
            Icon(
              completed ? Icons.check_circle : Icons.circle_outlined,
              color: completed
                  ? const Color(0xFF10B981)
                  : const Color(0xFFCBD5E1),
              size: 20,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16,
                      color: completed
                          ? const Color(0xFF334155)
                          : const Color(0xFF94A3B8),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    date,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color(0xFF64748B),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        if (!isLast)
          const Divider(
            height: 24,
            color: Color(0xFFF1F5F9),
          ),
      ],
    );
  }
}

class GoalCard extends StatelessWidget {
  final String icon;
  final String title;
  final String category;
  final Color categoryColor;
  final double current;
  final double target;
  final String deadline;
  final String unit;

  const GoalCard({
    super.key,
    required this.icon,
    required this.title,
    required this.category,
    required this.categoryColor,
    required this.current,
    required this.target,
    required this.deadline,
    required this.unit,
  });

  @override
  Widget build(BuildContext context) {
    final progress = (current / target * 100).round();
    final isNearComplete = progress >= 75;

    return Card(
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Text(
                icon,
                style: const TextStyle(fontSize: 32),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                title,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF0F172A),
                                ),
                              ),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  Container(
                                    width: 8,
                                    height: 8,
                                    decoration: BoxDecoration(
                                      color: categoryColor,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                  const SizedBox(width: 6),
                                  Text(
                                    category,
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: Color(0xFF64748B),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: isNearComplete
                                ? const Color(0xFFECFDF5)
                                : const Color(0xFFF1F5F9),
                            border: Border.all(
                              color: isNearComplete
                                  ? const Color(0xFF10B981)
                                  : const Color(0xFFE2E8F0),
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            '$progress%',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: isNearComplete
                                  ? const Color(0xFF10B981)
                                  : const Color(0xFF475569),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: LinearProgressIndicator(
                        value: current / target,
                        minHeight: 8,
                        backgroundColor: const Color(0xFFF1F5F9),
                        valueColor: AlwaysStoppedAnimation<Color>(
                          isNearComplete
                              ? const Color(0xFF10B981)
                              : const Color(0xFF4F46E5),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${current.toInt()}${unit.isNotEmpty ? " $unit" : ""} / ${target.toInt()}${unit.isNotEmpty ? " $unit" : ""}',
                          style: const TextStyle(
                            fontSize: 12,
                            color: Color(0xFF64748B),
                          ),
                        ),
                        Text(
                          deadline,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Color(0xFF64748B),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
